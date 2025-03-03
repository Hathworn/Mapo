; ModuleID = '../data/hip_kernels/9634/3/main.cu'
source_filename = "../data/hip_kernels/9634/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6primalPfS_PKfS1_S1_dii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, double %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = mul nsw i32 %25, %6
  %27 = add nsw i32 %26, %17
  %28 = icmp eq i32 %17, 0
  br i1 %28, label %29, label %33

29:                                               ; preds = %8
  %30 = sext i32 %27 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %33

33:                                               ; preds = %29, %8
  %34 = phi float [ %32, %29 ], [ 0.000000e+00, %8 ]
  %35 = icmp sgt i32 %17, 0
  %36 = add nsw i32 %6, -1
  %37 = icmp slt i32 %17, %36
  %38 = and i1 %35, %37
  br i1 %38, label %39, label %48

39:                                               ; preds = %33
  %40 = sext i32 %27 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %3, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = add nsw i32 %27, -1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fsub contract float %42, %46
  br label %48

48:                                               ; preds = %39, %33
  %49 = phi float [ %47, %39 ], [ %34, %33 ]
  %50 = icmp eq i32 %17, %36
  br i1 %50, label %51, label %57

51:                                               ; preds = %48
  %52 = add nsw i32 %27, -1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = fneg contract float %55
  br label %57

57:                                               ; preds = %51, %48
  %58 = phi float [ %56, %51 ], [ %49, %48 ]
  %59 = icmp eq i32 %25, 0
  br i1 %59, label %60, label %64

60:                                               ; preds = %57
  %61 = sext i32 %27 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %4, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %64

64:                                               ; preds = %60, %57
  %65 = phi float [ %63, %60 ], [ 0.000000e+00, %57 ]
  %66 = icmp sgt i32 %25, 0
  %67 = add nsw i32 %7, -1
  %68 = icmp slt i32 %25, %67
  %69 = select i1 %66, i1 %68, i1 false
  br i1 %69, label %70, label %79

70:                                               ; preds = %64
  %71 = sext i32 %27 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %4, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = sub nsw i32 %27, %6
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %4, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fsub contract float %73, %77
  br label %79

79:                                               ; preds = %70, %64
  %80 = phi float [ %78, %70 ], [ %65, %64 ]
  %81 = icmp eq i32 %25, %67
  br i1 %81, label %82, label %88

82:                                               ; preds = %79
  %83 = sub nsw i32 %27, %6
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %4, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = fneg contract float %86
  br label %88

88:                                               ; preds = %82, %79
  %89 = phi float [ %87, %82 ], [ %80, %79 ]
  %90 = sext i32 %27 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fpext float %92 to double
  %94 = fadd contract float %58, %89
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fadd contract float %94, %96
  %98 = fpext float %97 to double
  %99 = fmul contract double %98, %5
  %100 = fadd contract double %99, %93
  %101 = fadd contract double %5, 1.000000e+00
  %102 = fdiv contract double %100, %101
  %103 = fptrunc double %102 to float
  store float %103, float addrspace(1)* %91, align 4, !tbaa !7
  %104 = fmul contract float %103, 2.000000e+00
  %105 = fsub contract float %104, %92
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  store float %105, float addrspace(1)* %106, align 4, !tbaa !7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
