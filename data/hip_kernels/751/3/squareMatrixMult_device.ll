; ModuleID = '../data/hip_kernels/751/3/main.cu'
source_filename = "../data/hip_kernels/751/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16squareMatrixMultPfS_S_iE6tile_a = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ16squareMatrixMultPfS_S_iE6tile_b = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16squareMatrixMultPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !5
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %35, label %27

27:                                               ; preds = %4
  %28 = mul nsw i32 %8, %3
  %29 = add i32 %28, %11
  %30 = mul nsw i32 %3, %3
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ16squareMatrixMultPfS_S_iE6tile_a, i32 0, i32 %7, i32 %11
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ16squareMatrixMultPfS_S_iE6tile_b, i32 0, i32 %7, i32 %11
  %33 = udiv i32 %11, %3
  %34 = icmp ult i32 %33, 32
  br label %40

35:                                               ; preds = %62, %4
  %36 = phi float [ 0.000000e+00, %4 ], [ %63, %62 ]
  %37 = icmp slt i32 %8, %3
  %38 = icmp slt i32 %12, %3
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %77, label %82

40:                                               ; preds = %27, %62
  %41 = phi i32 [ 0, %27 ], [ %64, %62 ]
  %42 = phi float [ 0.000000e+00, %27 ], [ %63, %62 ]
  %43 = shl nsw i32 %41, 5
  %44 = add i32 %29, %43
  %45 = icmp slt i32 %44, %30
  br i1 %45, label %46, label %50

46:                                               ; preds = %40
  %47 = sext i32 %44 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !15
  br label %50

50:                                               ; preds = %40, %46
  %51 = phi float [ %49, %46 ], [ 0.000000e+00, %40 ]
  store float %51, float addrspace(3)* %31, align 4, !tbaa !16
  %52 = add nuw i32 %43, %7
  %53 = mul i32 %52, %3
  %54 = add i32 %53, %12
  %55 = icmp slt i32 %54, %30
  br i1 %55, label %56, label %60

56:                                               ; preds = %50
  %57 = sext i32 %54 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !15
  br label %60

60:                                               ; preds = %50, %56
  %61 = phi float [ %59, %56 ], [ 0.000000e+00, %50 ]
  store float %61, float addrspace(3)* %32, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %66, label %62

62:                                               ; preds = %66, %60
  %63 = phi float [ %42, %60 ], [ %74, %66 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = add nuw nsw i32 %41, 1
  %65 = icmp eq i32 %64, %25
  br i1 %65, label %35, label %40, !llvm.loop !20

66:                                               ; preds = %60, %66
  %67 = phi i32 [ %75, %66 ], [ %33, %60 ]
  %68 = phi float [ %74, %66 ], [ %42, %60 ]
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ16squareMatrixMultPfS_S_iE6tile_a, i32 0, i32 %7, i32 %67
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !16
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ16squareMatrixMultPfS_S_iE6tile_b, i32 0, i32 %67, i32 %11
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !16
  %73 = fmul contract float %70, %72
  %74 = fadd contract float %68, %73
  %75 = add nuw nsw i32 %67, 1
  %76 = icmp ult i32 %67, 31
  br i1 %76, label %66, label %62, !llvm.loop !22

77:                                               ; preds = %35
  %78 = mul nsw i32 %8, %3
  %79 = add nsw i32 %78, %12
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  store float %36, float addrspace(1)* %81, align 4, !tbaa !16
  br label %82

82:                                               ; preds = %77, %35
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
