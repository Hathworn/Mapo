; ModuleID = '../data/hip_kernels/2890/13/main.cu'
source_filename = "../data/hip_kernels/2890/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26Solve_redblack1_new_KernelPfPKfiiiiS1_S1_S1_ffb(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float %9, float %10, i1 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %13, %21
  %23 = add i32 %22, %15
  %24 = getelementptr i8, i8 addrspace(4)* %17, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul i32 %14, %27
  %29 = add i32 %28, %16
  %30 = srem i32 %29, 2
  %31 = xor i1 %11, true
  %32 = zext i1 %31 to i32
  %33 = add nsw i32 %30, %32
  %34 = shl nsw i32 %23, 1
  %35 = add nsw i32 %33, %34
  %36 = icmp slt i32 %35, %2
  %37 = icmp slt i32 %29, %3
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %130

39:                                               ; preds = %12
  %40 = mul nsw i32 %29, %2
  %41 = add nsw i32 %35, %40
  %42 = mul nsw i32 %4, %2
  %43 = mul nsw i32 %41, %4
  %44 = add nsw i32 %43, %5
  %45 = icmp sgt i32 %29, 0
  br i1 %45, label %46, label %59

46:                                               ; preds = %39
  %47 = sub nsw i32 %41, %2
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %8, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !6
  %51 = fmul contract float %50, %9
  %52 = fadd contract float %51, 0.000000e+00
  %53 = sub nsw i32 %44, %42
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !6
  %57 = fmul contract float %51, %56
  %58 = fadd contract float %57, 0.000000e+00
  br label %59

59:                                               ; preds = %46, %39
  %60 = phi float [ %52, %46 ], [ 0.000000e+00, %39 ]
  %61 = phi float [ %58, %46 ], [ 0.000000e+00, %39 ]
  %62 = add nsw i32 %3, -1
  %63 = icmp slt i32 %29, %62
  br i1 %63, label %64, label %76

64:                                               ; preds = %59
  %65 = sext i32 %41 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %8, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = fmul contract float %67, %9
  %69 = fadd contract float %60, %68
  %70 = add nsw i32 %44, %42
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = fmul contract float %68, %73
  %75 = fadd contract float %61, %74
  br label %76

76:                                               ; preds = %64, %59
  %77 = phi float [ %69, %64 ], [ %60, %59 ]
  %78 = phi float [ %75, %64 ], [ %61, %59 ]
  %79 = icmp sgt i32 %35, 0
  br i1 %79, label %80, label %93

80:                                               ; preds = %76
  %81 = add nsw i32 %41, -1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %7, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %85 = fmul contract float %84, %9
  %86 = fadd contract float %77, %85
  %87 = sub nsw i32 %44, %4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !6
  %91 = fmul contract float %85, %90
  %92 = fadd contract float %78, %91
  br label %93

93:                                               ; preds = %80, %76
  %94 = phi float [ %86, %80 ], [ %77, %76 ]
  %95 = phi float [ %92, %80 ], [ %78, %76 ]
  %96 = add nsw i32 %2, -1
  %97 = icmp slt i32 %35, %96
  %98 = sext i32 %41 to i64
  br i1 %97, label %99, label %110

99:                                               ; preds = %93
  %100 = getelementptr inbounds float, float addrspace(1)* %7, i64 %98
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = fmul contract float %101, %9
  %103 = fadd contract float %94, %102
  %104 = add nsw i32 %44, %4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = fmul contract float %102, %107
  %109 = fadd contract float %95, %108
  br label %110

110:                                              ; preds = %93, %99
  %111 = phi float [ %103, %99 ], [ %94, %93 ]
  %112 = phi float [ %109, %99 ], [ %95, %93 ]
  %113 = getelementptr inbounds float, float addrspace(1)* %6, i64 %98
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !6
  %115 = fadd contract float %111, %114
  %116 = sext i32 %44 to i64
  %117 = fcmp contract ogt float %115, 0.000000e+00
  br i1 %117, label %118, label %130

118:                                              ; preds = %110
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !6
  %121 = fmul contract float %114, %120
  %122 = fadd contract float %112, %121
  %123 = fdiv contract float %122, %115
  %124 = fmul contract float %123, %10
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = fsub contract float 1.000000e+00, %10
  %128 = fmul contract float %127, %126
  %129 = fadd contract float %128, %124
  store float %129, float addrspace(1)* %125, align 4, !tbaa !7
  br label %130

130:                                              ; preds = %110, %118, %12
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
