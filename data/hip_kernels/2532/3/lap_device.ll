; ModuleID = '../data/hip_kernels/2532/3/main.cu'
source_filename = "../data/hip_kernels/2532/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3lapPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = mul nsw i32 %21, %2
  %23 = add nsw i32 %22, %13
  %24 = icmp slt i32 %13, %2
  %25 = icmp slt i32 %21, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %79

27:                                               ; preds = %4
  %28 = icmp sgt i32 %13, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %27
  %30 = add nsw i32 %23, -1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fadd contract float %33, 0.000000e+00
  br label %35

35:                                               ; preds = %29, %27
  %36 = phi float [ 1.000000e+00, %29 ], [ 0.000000e+00, %27 ]
  %37 = phi float [ %34, %29 ], [ 0.000000e+00, %27 ]
  %38 = icmp sgt i32 %21, 0
  br i1 %38, label %39, label %46

39:                                               ; preds = %35
  %40 = sub nsw i32 %23, %2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fadd contract float %37, %43
  %45 = fadd contract float %36, 1.000000e+00
  br label %46

46:                                               ; preds = %39, %35
  %47 = phi float [ %45, %39 ], [ %36, %35 ]
  %48 = phi float [ %44, %39 ], [ %37, %35 ]
  %49 = add nsw i32 %2, -1
  %50 = icmp slt i32 %13, %49
  br i1 %50, label %51, label %58

51:                                               ; preds = %46
  %52 = add nsw i32 %23, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = fadd contract float %48, %55
  %57 = fadd contract float %47, 1.000000e+00
  br label %58

58:                                               ; preds = %51, %46
  %59 = phi float [ %57, %51 ], [ %47, %46 ]
  %60 = phi float [ %56, %51 ], [ %48, %46 ]
  %61 = add nsw i32 %3, -1
  %62 = icmp slt i32 %21, %61
  br i1 %62, label %63, label %70

63:                                               ; preds = %58
  %64 = add nsw i32 %23, %2
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fadd contract float %60, %67
  %69 = fadd contract float %59, 1.000000e+00
  br label %70

70:                                               ; preds = %63, %58
  %71 = phi float [ %69, %63 ], [ %59, %58 ]
  %72 = phi float [ %68, %63 ], [ %60, %58 ]
  %73 = sext i32 %23 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fmul contract float %71, %75
  %77 = fsub contract float %72, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  store float %77, float addrspace(1)* %78, align 4, !tbaa !7
  br label %79

79:                                               ; preds = %70, %4
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
