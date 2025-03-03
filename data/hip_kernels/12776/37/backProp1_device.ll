; ModuleID = '../data/hip_kernels/12776/37/main.cu'
source_filename = "../data/hip_kernels/12776/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9backProp1PfS_S_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = mul nsw i32 %20, 10
  %22 = load float, float addrspace(1)* %4, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = load float, float addrspace(1)* %5, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fsub contract float %22, %23
  %25 = sext i32 %21 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = fmul contract float %24, %27
  %29 = fadd contract float %28, 0.000000e+00
  %30 = getelementptr inbounds float, float addrspace(1)* %4, i64 1
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = getelementptr inbounds float, float addrspace(1)* %5, i64 1
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fsub contract float %31, %33
  %35 = or i32 %21, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = fmul contract float %34, %38
  %40 = fadd contract float %29, %39
  %41 = getelementptr inbounds float, float addrspace(1)* %4, i64 2
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 2
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = fsub contract float %42, %44
  %46 = add nsw i32 %21, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = fmul contract float %45, %49
  %51 = fadd contract float %40, %50
  %52 = getelementptr inbounds float, float addrspace(1)* %4, i64 3
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = getelementptr inbounds float, float addrspace(1)* %5, i64 3
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = fsub contract float %53, %55
  %57 = add nsw i32 %21, 3
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %56, %60
  %62 = fadd contract float %51, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 4
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = getelementptr inbounds float, float addrspace(1)* %5, i64 4
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fsub contract float %64, %66
  %68 = add nsw i32 %21, 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %3, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fmul contract float %67, %71
  %73 = fadd contract float %62, %72
  %74 = getelementptr inbounds float, float addrspace(1)* %4, i64 5
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = getelementptr inbounds float, float addrspace(1)* %5, i64 5
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fsub contract float %75, %77
  %79 = add nsw i32 %21, 5
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fmul contract float %78, %82
  %84 = fadd contract float %73, %83
  %85 = getelementptr inbounds float, float addrspace(1)* %4, i64 6
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = getelementptr inbounds float, float addrspace(1)* %5, i64 6
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fsub contract float %86, %88
  %90 = add nsw i32 %21, 6
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract float %89, %93
  %95 = fadd contract float %84, %94
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 7
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = getelementptr inbounds float, float addrspace(1)* %5, i64 7
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = fsub contract float %97, %99
  %101 = add nsw i32 %21, 7
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %3, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract float %100, %104
  %106 = fadd contract float %95, %105
  %107 = getelementptr inbounds float, float addrspace(1)* %4, i64 8
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = getelementptr inbounds float, float addrspace(1)* %5, i64 8
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = fsub contract float %108, %110
  %112 = add nsw i32 %21, 8
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %3, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fmul contract float %111, %115
  %117 = fadd contract float %106, %116
  %118 = getelementptr inbounds float, float addrspace(1)* %4, i64 9
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = getelementptr inbounds float, float addrspace(1)* %5, i64 9
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fsub contract float %119, %121
  %123 = add nsw i32 %21, 9
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %3, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %117, %127
  %129 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %130 = mul i32 %129, %11
  %131 = add i32 %130, %12
  %132 = sext i32 %20 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %2, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = fsub contract float 1.000000e+00, %134
  %136 = fmul contract float %134, %135
  %137 = fmul contract float %128, %136
  %138 = sext i32 %131 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = fmul contract float %140, %137
  %142 = fpext float %141 to double
  %143 = fdiv contract double %142, 6.000000e+03
  %144 = shl nsw i32 %131, 7
  %145 = add nsw i32 %144, %20
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = fpext float %148 to double
  %150 = fadd contract double %143, %149
  %151 = fptrunc double %150 to float
  store float %151, float addrspace(1)* %147, align 4, !tbaa !7
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
