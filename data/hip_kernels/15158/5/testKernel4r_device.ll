; ModuleID = '../data/hip_kernels/15158/5/main.cu'
source_filename = "../data/hip_kernels/15158/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12testKernel4rPfS_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %18, label %5

5:                                                ; preds = %2
  %6 = mul i32 %3, 22
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = add i32 %8, -22
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = zext i32 %8 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = fsub contract float %12, %15
  %17 = fadd contract float %16, 0.000000e+00
  br label %18

18:                                               ; preds = %5, %2
  %19 = phi float [ %17, %5 ], [ 0.000000e+00, %2 ]
  %20 = phi float [ 1.000000e+00, %5 ], [ 0.000000e+00, %2 ]
  %21 = icmp ult i32 %3, 21
  br i1 %21, label %24, label %22

22:                                               ; preds = %18
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  br label %38

24:                                               ; preds = %18
  %25 = mul nuw nsw i32 %3, 22
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %27 = add nuw nsw i32 %25, %26
  %28 = add nuw nsw i32 %27, 22
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = zext i32 %27 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = fsub contract float %31, %34
  %36 = fadd contract float %19, %35
  %37 = fadd contract float %20, 1.000000e+00
  br label %38

38:                                               ; preds = %22, %24
  %39 = phi i32 [ %23, %22 ], [ %26, %24 ]
  %40 = phi float [ %19, %22 ], [ %36, %24 ]
  %41 = phi float [ %20, %22 ], [ %37, %24 ]
  %42 = icmp eq i32 %39, 0
  br i1 %42, label %56, label %43

43:                                               ; preds = %38
  %44 = mul i32 %3, 22
  %45 = add i32 %44, %39
  %46 = add i32 %45, -1
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = zext i32 %45 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = fsub contract float %49, %52
  %54 = fadd contract float %40, %53
  %55 = fadd contract float %41, 1.000000e+00
  br label %56

56:                                               ; preds = %43, %38
  %57 = phi float [ %54, %43 ], [ %40, %38 ]
  %58 = phi float [ %55, %43 ], [ %41, %38 ]
  %59 = icmp ult i32 %39, 21
  br i1 %59, label %60, label %73

60:                                               ; preds = %56
  %61 = mul i32 %3, 22
  %62 = add i32 %61, %39
  %63 = add i32 %62, 1
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  %67 = zext i32 %62 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = fsub contract float %66, %69
  %71 = fadd contract float %57, %70
  %72 = fadd contract float %58, 1.000000e+00
  br label %73

73:                                               ; preds = %60, %56
  %74 = phi float [ %71, %60 ], [ %57, %56 ]
  %75 = phi float [ %72, %60 ], [ %58, %56 ]
  br i1 %4, label %76, label %78

76:                                               ; preds = %73
  %77 = zext i32 %39 to i64
  br label %87

78:                                               ; preds = %73
  %79 = mul i32 %3, 22
  %80 = add i32 %79, %39
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = fdiv contract float %74, %75
  %85 = fmul contract float %84, 5.000000e-01
  %86 = fadd contract float %85, %83
  br label %87

87:                                               ; preds = %78, %76
  %88 = phi i64 [ %81, %78 ], [ %77, %76 ]
  %89 = phi float [ %86, %78 ], [ 1.000000e+00, %76 ]
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  store float %89, float addrspace(1)* %90, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
