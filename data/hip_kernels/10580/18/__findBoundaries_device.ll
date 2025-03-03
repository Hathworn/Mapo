; ModuleID = '../data/hip_kernels/10580/18/main.cu'
source_filename = "../data/hip_kernels/10580/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16__findBoundariesPxPiiiiE5dbuff = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16__findBoundariesPxPiiii(i64 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = sext i32 %2 to i64
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = zext i32 %7 to i64
  %9 = mul nsw i64 %6, %8
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !4
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = shl i32 %22, 5
  %24 = zext i32 %23 to i64
  %25 = sdiv i64 %9, %24
  %26 = trunc i64 %25 to i32
  %27 = shl i32 %26, 5
  %28 = add i32 %7, 1
  %29 = zext i32 %28 to i64
  %30 = mul nsw i64 %6, %29
  %31 = sdiv i64 %30, %24
  %32 = trunc i64 %31 to i32
  %33 = shl i32 %32, 5
  %34 = add i32 %33, 32
  %35 = tail call i32 @llvm.smin.i32(i32 %2, i32 %34)
  %36 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %37 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %38 = mul nuw nsw i32 %37, %17
  %39 = add nuw nsw i32 %38, %36
  %40 = icmp eq i32 %39, 0
  %41 = icmp eq i32 %7, 0
  %42 = select i1 %40, i1 %41, i1 false
  br i1 %42, label %43, label %44

43:                                               ; preds = %5
  store i32 0, i32 addrspace(1)* %1, align 4, !tbaa !16
  br label %44

44:                                               ; preds = %43, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp sgt i32 %27, %35
  br i1 %45, label %92, label %46

46:                                               ; preds = %44
  %47 = zext i32 %4 to i64
  %48 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16__findBoundariesPxPiiiiE5dbuff, i32 0, i32 %39
  %49 = add nsw i32 %39, -1
  %50 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16__findBoundariesPxPiiiiE5dbuff, i32 0, i32 %49
  %51 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %52 = bitcast i8 addrspace(4)* %51 to i16 addrspace(4)*
  %53 = load i16, i16 addrspace(4)* %52, align 2
  %54 = zext i16 %53 to i32
  %55 = mul nuw nsw i32 %54, %17
  %56 = add nsw i32 %55, -1
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16__findBoundariesPxPiiiiE5dbuff, i32 0, i32 %56
  br label %58

58:                                               ; preds = %46, %88
  %59 = phi i32 [ %27, %46 ], [ %90, %88 ]
  %60 = phi i32 [ 2147483647, %46 ], [ %89, %88 ]
  %61 = add nsw i32 %59, %39
  %62 = icmp slt i32 %61, %35
  br i1 %62, label %63, label %69

63:                                               ; preds = %58
  %64 = sext i32 %61 to i64
  %65 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %64
  %66 = load i64, i64 addrspace(1)* %65, align 8, !tbaa !20, !amdgpu.noclobber !14
  %67 = ashr i64 %66, %47
  %68 = trunc i64 %67 to i32
  store i32 %68, i32 addrspace(3)* %48, align 4, !tbaa !16
  br label %69

69:                                               ; preds = %63, %58
  %70 = phi i32 [ %68, %63 ], [ %3, %58 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = icmp eq i32 %61, %2
  %72 = select i1 %62, i1 true, i1 %71
  br i1 %72, label %73, label %88

73:                                               ; preds = %69
  br i1 %40, label %76, label %74

74:                                               ; preds = %73
  %75 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !16
  br label %76

76:                                               ; preds = %74, %73
  %77 = phi i32 [ %75, %74 ], [ %60, %73 ]
  %78 = icmp sgt i32 %70, %77
  br i1 %78, label %79, label %85

79:                                               ; preds = %76, %79
  %80 = phi i32 [ %81, %79 ], [ %77, %76 ]
  %81 = add nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  store i32 %61, i32 addrspace(1)* %83, align 4, !tbaa !16
  %84 = icmp slt i32 %81, %70
  br i1 %84, label %79, label %85, !llvm.loop !22

85:                                               ; preds = %79, %76
  br i1 %40, label %86, label %88

86:                                               ; preds = %85
  %87 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !16
  br label %88

88:                                               ; preds = %69, %85, %86
  %89 = phi i32 [ %87, %86 ], [ %77, %85 ], [ %60, %69 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = add i32 %55, %59
  %91 = icmp sgt i32 %90, %35
  br i1 %91, label %92, label %58, !llvm.loop !24

92:                                               ; preds = %88, %44
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"long long", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
