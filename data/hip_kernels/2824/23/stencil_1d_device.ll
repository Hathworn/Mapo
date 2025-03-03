; ModuleID = '../data/hip_kernels/2824/23/main.cu'
source_filename = "../data/hip_kernels/2824/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10stencil_1dPiS_iE4temp = internal unnamed_addr addrspace(3) global [262 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10stencil_1dPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = add nuw nsw i32 %4, 3
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %10
  %16 = add i32 %15, %4
  %17 = udiv i32 %13, %10
  %18 = mul i32 %17, %10
  %19 = icmp ugt i32 %13, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %10
  %23 = add i32 %10, %2
  %24 = icmp ult i32 %16, %23
  br i1 %24, label %25, label %83

25:                                               ; preds = %3
  %26 = getelementptr inbounds [262 x i32], [262 x i32] addrspace(3)* @_ZZ10stencil_1dPiS_iE4temp, i32 0, i32 %5
  %27 = icmp ult i32 %4, 3
  %28 = getelementptr inbounds [262 x i32], [262 x i32] addrspace(3)* @_ZZ10stencil_1dPiS_iE4temp, i32 0, i32 %4
  %29 = add nuw nsw i32 %5, %10
  %30 = getelementptr inbounds [262 x i32], [262 x i32] addrspace(3)* @_ZZ10stencil_1dPiS_iE4temp, i32 0, i32 %29
  %31 = add nuw nsw i32 %4, 6
  %32 = getelementptr inbounds [262 x i32], [262 x i32] addrspace(3)* @_ZZ10stencil_1dPiS_iE4temp, i32 0, i32 %31
  %33 = add nuw nsw i32 %4, 5
  %34 = getelementptr inbounds [262 x i32], [262 x i32] addrspace(3)* @_ZZ10stencil_1dPiS_iE4temp, i32 0, i32 %33
  %35 = add nuw nsw i32 %4, 4
  %36 = getelementptr inbounds [262 x i32], [262 x i32] addrspace(3)* @_ZZ10stencil_1dPiS_iE4temp, i32 0, i32 %35
  %37 = add nuw nsw i32 %4, 2
  %38 = getelementptr inbounds [262 x i32], [262 x i32] addrspace(3)* @_ZZ10stencil_1dPiS_iE4temp, i32 0, i32 %37
  %39 = add nuw nsw i32 %4, 1
  %40 = getelementptr inbounds [262 x i32], [262 x i32] addrspace(3)* @_ZZ10stencil_1dPiS_iE4temp, i32 0, i32 %39
  br label %41

41:                                               ; preds = %25, %80
  %42 = phi i32 [ %16, %25 ], [ %81, %80 ]
  store i32 0, i32 addrspace(3)* %26, align 4, !tbaa !16
  %43 = icmp slt i32 %42, %2
  br i1 %43, label %44, label %48

44:                                               ; preds = %41
  %45 = sext i32 %42 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !16
  store i32 %47, i32 addrspace(3)* %26, align 4, !tbaa !16
  br label %48

48:                                               ; preds = %44, %41
  br i1 %27, label %49, label %63

49:                                               ; preds = %48
  store i32 0, i32 addrspace(3)* %28, align 4, !tbaa !16
  %50 = icmp sgt i32 %42, 2
  br i1 %50, label %51, label %56

51:                                               ; preds = %49
  %52 = add nsw i32 %42, -3
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !16
  store i32 %55, i32 addrspace(3)* %28, align 4, !tbaa !16
  br label %56

56:                                               ; preds = %51, %49
  store i32 0, i32 addrspace(3)* %30, align 4, !tbaa !16
  %57 = add i32 %42, %10
  %58 = icmp slt i32 %57, %2
  br i1 %58, label %59, label %63

59:                                               ; preds = %56
  %60 = sext i32 %57 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !16
  store i32 %62, i32 addrspace(3)* %30, align 4, !tbaa !16
  br label %63

63:                                               ; preds = %56, %59, %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %43, label %64, label %80

64:                                               ; preds = %63
  %65 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !16
  %66 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !16
  %67 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !16
  %68 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !16
  %69 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !16
  %70 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !16
  %71 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !16
  %72 = add nsw i32 %70, %71
  %73 = add nsw i32 %69, %72
  %74 = add nsw i32 %68, %73
  %75 = add nsw i32 %67, %74
  %76 = add nsw i32 %66, %75
  %77 = add nsw i32 %65, %76
  %78 = sext i32 %42 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  store i32 %77, i32 addrspace(1)* %79, align 4, !tbaa !16
  br label %80

80:                                               ; preds = %64, %63
  %81 = add nsw i32 %42, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = icmp ult i32 %81, %23
  br i1 %82, label %41, label %83, !llvm.loop !20

83:                                               ; preds = %80, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
