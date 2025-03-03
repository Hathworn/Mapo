; ModuleID = '../data/hip_kernels/2890/14/main.cu'
source_filename = "../data/hip_kernels/2890/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22Solve_redblack2_KernelPfPKfiiiiS1_S1_ffb(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float %8, float %9, i1 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %12, %20
  %22 = add i32 %21, %14
  %23 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %13, %26
  %28 = add i32 %27, %15
  %29 = icmp slt i32 %22, %2
  %30 = icmp slt i32 %28, %3
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %125

32:                                               ; preds = %11
  %33 = add nsw i32 %28, %22
  %34 = srem i32 %33, 2
  %35 = zext i1 %10 to i32
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %125, label %37

37:                                               ; preds = %32
  %38 = mul nsw i32 %28, %2
  %39 = add nsw i32 %38, %22
  %40 = mul nsw i32 %4, %2
  %41 = mul nsw i32 %39, %4
  %42 = add nsw i32 %41, %5
  %43 = icmp sgt i32 %28, 0
  br i1 %43, label %44, label %57

44:                                               ; preds = %37
  %45 = sub nsw i32 %39, %2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %7, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = fmul contract float %48, %8
  %50 = fadd contract float %49, 0.000000e+00
  %51 = sub nsw i32 %42, %40
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = fmul contract float %49, %54
  %56 = fadd contract float %55, 0.000000e+00
  br label %57

57:                                               ; preds = %44, %37
  %58 = phi float [ %50, %44 ], [ 0.000000e+00, %37 ]
  %59 = phi float [ %56, %44 ], [ 0.000000e+00, %37 ]
  %60 = add nsw i32 %3, -1
  %61 = icmp slt i32 %28, %60
  br i1 %61, label %62, label %74

62:                                               ; preds = %57
  %63 = sext i32 %39 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %7, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = fmul contract float %65, %8
  %67 = fadd contract float %58, %66
  %68 = add nsw i32 %42, %40
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = fmul contract float %66, %71
  %73 = fadd contract float %59, %72
  br label %74

74:                                               ; preds = %62, %57
  %75 = phi float [ %67, %62 ], [ %58, %57 ]
  %76 = phi float [ %73, %62 ], [ %59, %57 ]
  %77 = icmp sgt i32 %22, 0
  br i1 %77, label %78, label %91

78:                                               ; preds = %74
  %79 = add nsw i32 %39, -1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %6, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = fmul contract float %82, %8
  %84 = fadd contract float %75, %83
  %85 = sub nsw i32 %42, %4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !6
  %89 = fmul contract float %83, %88
  %90 = fadd contract float %76, %89
  br label %91

91:                                               ; preds = %78, %74
  %92 = phi float [ %84, %78 ], [ %75, %74 ]
  %93 = phi float [ %90, %78 ], [ %76, %74 ]
  %94 = add nsw i32 %2, -1
  %95 = icmp slt i32 %22, %94
  br i1 %95, label %96, label %108

96:                                               ; preds = %91
  %97 = sext i32 %39 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %6, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !6
  %100 = fmul contract float %99, %8
  %101 = fadd contract float %92, %100
  %102 = add nsw i32 %42, %4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = fmul contract float %100, %105
  %107 = fadd contract float %93, %106
  br label %108

108:                                              ; preds = %96, %91
  %109 = phi float [ %101, %96 ], [ %92, %91 ]
  %110 = phi float [ %107, %96 ], [ %93, %91 ]
  %111 = fadd contract float %109, 1.000000e+00
  %112 = sext i32 %42 to i64
  %113 = fcmp contract ogt float %111, 0.000000e+00
  br i1 %113, label %114, label %125

114:                                              ; preds = %108
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !6
  %117 = fadd contract float %110, %116
  %118 = fdiv contract float %117, %111
  %119 = fmul contract float %118, %9
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fsub contract float 1.000000e+00, %9
  %123 = fmul contract float %122, %121
  %124 = fadd contract float %123, %119
  store float %124, float addrspace(1)* %120, align 4, !tbaa !7
  br label %125

125:                                              ; preds = %108, %114, %32, %11
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
