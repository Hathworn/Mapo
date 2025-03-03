; ModuleID = '../data/hip_kernels/8184/10/main.cu'
source_filename = "../data/hip_kernels/8184/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z14d_sct_axinterpPfPKfPK15HIP_vector_typeIiLj4EEPKS2_IfLj4EEPKsiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, %struct.HIP_vector_type.0 addrspace(1)* nocapture readonly %3, i16 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = trunc i32 %11 to i8
  %13 = shl i8 %12, 1
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = zext i32 %14 to i64
  %16 = shl i64 %15, 48
  %17 = ashr exact i64 %16, 48
  %18 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %17, i32 0, i32 0, i32 0, i64 0
  %19 = load float, float addrspace(1)* %18, align 16, !tbaa !5, !amdgpu.noclobber !8
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i64 0
  %21 = load i32, i32 addrspace(1)* %20, align 16, !tbaa !5, !amdgpu.noclobber !8
  %22 = mul nsw i32 %21, %5
  %23 = sext i8 %13 to i32
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !9, !invariant.load !8
  %28 = zext i16 %27 to i32
  %29 = mul nsw i32 %28, %23
  %30 = shl i32 %10, 24
  %31 = ashr exact i32 %30, 24
  %32 = add nsw i32 %29, %31
  %33 = add i32 %32, %22
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !10, !amdgpu.noclobber !8
  %37 = fmul contract float %19, %36
  %38 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %17, i32 0, i32 0, i32 0, i64 1
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !8
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i64 1
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !8
  %42 = mul nsw i32 %41, %5
  %43 = add i32 %32, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !10, !amdgpu.noclobber !8
  %47 = fmul contract float %39, %46
  %48 = fadd contract float %37, %47
  %49 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %17, i32 0, i32 0, i32 0, i64 2
  %50 = load float, float addrspace(1)* %49, align 8, !tbaa !5, !amdgpu.noclobber !8
  %51 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i64 2
  %52 = load i32, i32 addrspace(1)* %51, align 8, !tbaa !5, !amdgpu.noclobber !8
  %53 = mul nsw i32 %52, %5
  %54 = add i32 %32, %53
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !10, !amdgpu.noclobber !8
  %58 = fmul contract float %50, %57
  %59 = fadd contract float %48, %58
  %60 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %17, i32 0, i32 0, i32 0, i64 3
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !8
  %62 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i64 3
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !8
  %64 = mul nsw i32 %63, %5
  %65 = add i32 %32, %64
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !10, !amdgpu.noclobber !8
  %69 = fmul contract float %61, %68
  %70 = fadd contract float %59, %69
  %71 = or i8 %13, 1
  %72 = sext i8 %71 to i32
  %73 = mul nsw i32 %28, %72
  %74 = add nsw i32 %73, %31
  %75 = add i32 %74, %22
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !10, !amdgpu.noclobber !8
  %79 = fmul contract float %19, %78
  %80 = add i32 %74, %42
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !10, !amdgpu.noclobber !8
  %84 = fmul contract float %39, %83
  %85 = fadd contract float %79, %84
  %86 = add i32 %74, %53
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !10, !amdgpu.noclobber !8
  %90 = fmul contract float %50, %89
  %91 = fadd contract float %85, %90
  %92 = add i32 %74, %64
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !10, !amdgpu.noclobber !8
  %96 = fmul contract float %61, %95
  %97 = fadd contract float %91, %96
  switch i32 %7, label %136 [
    i32 1, label %98
    i32 11, label %112
  ]

98:                                               ; preds = %9
  %99 = shl i32 %14, 16
  %100 = ashr exact i32 %99, 16
  %101 = mul nsw i32 %100, %5
  %102 = add nsw i32 %101, %8
  %103 = add nsw i32 %72, -1
  %104 = mul nsw i32 %103, %28
  %105 = add i32 %102, %31
  %106 = add i32 %105, %104
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  store float %70, float addrspace(1)* %108, align 4, !tbaa !10
  %109 = add i32 %74, %102
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  store float %97, float addrspace(1)* %111, align 4, !tbaa !10
  br label %136

112:                                              ; preds = %9
  %113 = shl i32 %14, 16
  %114 = ashr exact i32 %113, 16
  %115 = icmp slt i32 %114, %6
  br i1 %115, label %116, label %136

116:                                              ; preds = %112
  %117 = getelementptr inbounds i16, i16 addrspace(1)* %4, i64 %17
  %118 = load i16, i16 addrspace(1)* %117, align 2, !tbaa !12, !amdgpu.noclobber !8
  %119 = sext i32 %8 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = sext i16 %118 to i32
  %122 = mul nsw i32 %121, %5
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %120, i64 %123
  %125 = add nsw i32 %72, -1
  %126 = mul nsw i32 %125, %28
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %124, i64 %127
  %129 = sext i32 %31 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %128, i64 %129
  %131 = atomicrmw fadd float addrspace(1)* %130, float %70 syncscope("agent-one-as") monotonic, align 4
  %132 = zext i32 %73 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %124, i64 %132
  %134 = getelementptr inbounds float, float addrspace(1)* %133, i64 %129
  %135 = atomicrmw fadd float addrspace(1)* %134, float %97 syncscope("agent-one-as") monotonic, align 4
  br label %136

136:                                              ; preds = %9, %116, %112, %98
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"short", !6, i64 0}
