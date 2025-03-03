; ModuleID = '../data/hip_kernels/2532/6/main.cu'
source_filename = "../data/hip_kernels/2532/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z4updFPfS_S_ffii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float %3, float %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %24, %5
  %26 = add nsw i32 %25, %16
  %27 = icmp slt i32 %16, %5
  %28 = icmp slt i32 %24, %6
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %85

30:                                               ; preds = %7
  %31 = add nsw i32 %5, -1
  %32 = icmp slt i32 %16, %31
  br i1 %32, label %33, label %39

33:                                               ; preds = %30
  %34 = shl nsw i32 %26, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fadd contract float %37, 0.000000e+00
  br label %39

39:                                               ; preds = %33, %30
  %40 = phi float [ %38, %33 ], [ 0.000000e+00, %30 ]
  %41 = icmp sgt i32 %16, 0
  br i1 %41, label %42, label %49

42:                                               ; preds = %39
  %43 = shl i32 %26, 1
  %44 = add i32 %43, -2
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fsub contract float %40, %47
  br label %49

49:                                               ; preds = %42, %39
  %50 = phi float [ %48, %42 ], [ %40, %39 ]
  %51 = add nsw i32 %6, -1
  %52 = icmp slt i32 %24, %51
  br i1 %52, label %53, label %60

53:                                               ; preds = %49
  %54 = shl nsw i32 %26, 1
  %55 = add nuw nsw i32 %54, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = fadd contract float %50, %58
  br label %60

60:                                               ; preds = %53, %49
  %61 = phi float [ %59, %53 ], [ %50, %49 ]
  %62 = icmp sgt i32 %24, 0
  br i1 %62, label %63, label %71

63:                                               ; preds = %60
  %64 = sub nsw i32 %26, %5
  %65 = shl nsw i32 %64, 1
  %66 = add nuw nsw i32 %65, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fsub contract float %61, %69
  br label %71

71:                                               ; preds = %63, %60
  %72 = phi float [ %70, %63 ], [ %61, %60 ]
  %73 = sext i32 %26 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fmul contract float %72, %3
  %77 = fadd contract float %75, %76
  %78 = fmul contract float %3, %4
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = fmul contract float %78, %80
  %82 = fadd contract float %77, %81
  %83 = fadd contract float %78, 1.000000e+00
  %84 = fdiv contract float %82, %83
  store float %84, float addrspace(1)* %74, align 4, !tbaa !7
  br label %85

85:                                               ; preds = %71, %7
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
