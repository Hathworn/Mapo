; ModuleID = '../data/hip_kernels/7238/13/main.cu'
source_filename = "../data/hip_kernels/7238/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18kernel_extract_roiPfS_Pciiiiiiiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i8 addrspace(1)* nocapture readnone %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %17, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !4, !invariant.load !5
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %33 = add i32 %31, %32
  %34 = icmp ult i32 %25, %4
  %35 = icmp ult i32 %33, %5
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %157

37:                                               ; preds = %16
  %38 = uitofp i32 %25 to float
  %39 = sitofp i32 %14 to float
  %40 = fmul contract float %39, %38
  %41 = sitofp i32 %4 to float
  %42 = fdiv contract float %40, %41
  %43 = sitofp i32 %12 to float
  %44 = fadd contract float %42, %43
  %45 = uitofp i32 %33 to float
  %46 = sitofp i32 %15 to float
  %47 = fmul contract float %46, %45
  %48 = sitofp i32 %5 to float
  %49 = fdiv contract float %47, %48
  %50 = sitofp i32 %13 to float
  %51 = fadd contract float %49, %50
  %52 = tail call float @llvm.floor.f32(float %44)
  %53 = fptosi float %52 to i32
  %54 = tail call float @llvm.floor.f32(float %51)
  %55 = fptosi float %54 to i32
  %56 = tail call float @llvm.ceil.f32(float %44)
  %57 = fptosi float %56 to i32
  %58 = tail call float @llvm.ceil.f32(float %51)
  %59 = fptosi float %58 to i32
  %60 = fsub contract float %44, %52
  %61 = fsub contract float %51, %54
  %62 = fsub contract float 1.000000e+00, %60
  %63 = fsub contract float 1.000000e+00, %61
  %64 = fmul contract float %62, %63
  %65 = fmul contract float %60, %63
  %66 = fmul contract float %62, %61
  %67 = fmul contract float %60, %61
  %68 = mul nsw i32 %55, %3
  %69 = add nsw i32 %68, %53
  %70 = add nsw i32 %68, %57
  %71 = mul nsw i32 %59, %3
  %72 = add nsw i32 %71, %53
  %73 = add nsw i32 %71, %57
  %74 = mul i32 %33, %4
  %75 = add i32 %74, %25
  %76 = add nsw i32 %69, %6
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract float %64, %79
  %81 = add nsw i32 %70, %6
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = fmul contract float %65, %84
  %86 = fadd contract float %80, %85
  %87 = add nsw i32 %72, %6
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract float %66, %90
  %92 = fadd contract float %86, %91
  %93 = add nsw i32 %73, %6
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fmul contract float %67, %96
  %98 = fadd contract float %92, %97
  %99 = tail call float @llvm.round.f32(float %98)
  %100 = add nsw i32 %75, %9
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  store float %99, float addrspace(1)* %102, align 4, !tbaa !7
  %103 = add nsw i32 %69, %7
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fmul contract float %64, %106
  %108 = add nsw i32 %70, %7
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = fmul contract float %65, %111
  %113 = fadd contract float %107, %112
  %114 = add nsw i32 %72, %7
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fmul contract float %66, %117
  %119 = fadd contract float %113, %118
  %120 = add nsw i32 %73, %7
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7
  %124 = fmul contract float %67, %123
  %125 = fadd contract float %119, %124
  %126 = tail call float @llvm.round.f32(float %125)
  %127 = add nsw i32 %75, %10
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  store float %126, float addrspace(1)* %129, align 4, !tbaa !7
  %130 = add nsw i32 %69, %8
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7
  %134 = fmul contract float %64, %133
  %135 = add nsw i32 %70, %8
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %139 = fmul contract float %65, %138
  %140 = fadd contract float %134, %139
  %141 = add nsw i32 %72, %8
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = fmul contract float %66, %144
  %146 = fadd contract float %140, %145
  %147 = add nsw i32 %73, %8
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = fmul contract float %67, %150
  %152 = fadd contract float %146, %151
  %153 = tail call float @llvm.round.f32(float %152)
  %154 = add nsw i32 %75, %11
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %155
  store float %153, float addrspace(1)* %156, align 4, !tbaa !7
  br label %157

157:                                              ; preds = %37, %16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.round.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
