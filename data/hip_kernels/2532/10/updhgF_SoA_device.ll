; ModuleID = '../data/hip_kernels/2532/10/main.cu'
source_filename = "../data/hip_kernels/2532/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10updhgF_SoAPfS_S_S_ffii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, float %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  %28 = icmp slt i32 %17, %6
  %29 = icmp slt i32 %25, %7
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %79

31:                                               ; preds = %8
  %32 = add nsw i32 %6, -1
  %33 = icmp slt i32 %17, %32
  br i1 %33, label %34, label %39

34:                                               ; preds = %31
  %35 = sext i32 %27 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fadd contract float %37, 0.000000e+00
  br label %39

39:                                               ; preds = %34, %31
  %40 = phi float [ %38, %34 ], [ 0.000000e+00, %31 ]
  %41 = icmp sgt i32 %17, 0
  br i1 %41, label %42, label %48

42:                                               ; preds = %39
  %43 = add nsw i32 %27, -1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fsub contract float %40, %46
  br label %48

48:                                               ; preds = %42, %39
  %49 = phi float [ %47, %42 ], [ %40, %39 ]
  %50 = add nsw i32 %7, -1
  %51 = icmp slt i32 %25, %50
  br i1 %51, label %52, label %57

52:                                               ; preds = %48
  %53 = sext i32 %27 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = fadd contract float %49, %55
  br label %57

57:                                               ; preds = %52, %48
  %58 = phi float [ %56, %52 ], [ %49, %48 ]
  %59 = icmp sgt i32 %25, 0
  br i1 %59, label %60, label %66

60:                                               ; preds = %57
  %61 = sub nsw i32 %27, %6
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fsub contract float %58, %64
  br label %66

66:                                               ; preds = %60, %57
  %67 = phi float [ %65, %60 ], [ %58, %57 ]
  %68 = fsub contract float 1.000000e+00, %4
  %69 = sext i32 %27 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fmul contract float %68, %71
  %73 = getelementptr inbounds float, float addrspace(1)* %3, i64 %69
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract float %67, %5
  %76 = fadd contract float %75, %74
  %77 = fmul contract float %76, %4
  %78 = fadd contract float %72, %77
  store float %78, float addrspace(1)* %70, align 4, !tbaa !7
  br label %79

79:                                               ; preds = %66, %8
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
