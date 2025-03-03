; ModuleID = '../data/hip_kernels/16974/4/main.cu'
source_filename = "../data/hip_kernels/16974/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10popInicialjjPiS_S_(i32 %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %11
  %24 = icmp ult i32 %17, %0
  br i1 %24, label %25, label %35

25:                                               ; preds = %5
  %26 = icmp eq i32 %1, 0
  %27 = and i32 %1, 3
  %28 = icmp ult i32 %1, 4
  %29 = and i32 %1, -4
  %30 = icmp eq i32 %27, 0
  br label %31

31:                                               ; preds = %25, %57
  %32 = phi i32 [ %17, %25 ], [ %58, %57 ]
  br i1 %26, label %57, label %33

33:                                               ; preds = %31
  %34 = mul i32 %32, %1
  br i1 %28, label %36, label %60

35:                                               ; preds = %57, %5
  ret void

36:                                               ; preds = %60, %33
  %37 = phi i32 [ 0, %33 ], [ %118, %60 ]
  br i1 %30, label %57, label %38

38:                                               ; preds = %36, %38
  %39 = phi i32 [ %54, %38 ], [ %37, %36 ]
  %40 = phi i32 [ %55, %38 ], [ 0, %36 ]
  %41 = add i32 %39, %34
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !16
  %45 = tail call i32 @llvm.smax.i32(i32 %44, i32 %39)
  %46 = add i32 %45, %34
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !16
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %42
  store i32 %49, i32 addrspace(1)* %50, align 4, !tbaa !16
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %42
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16
  %53 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !16
  store i32 %53, i32 addrspace(1)* %51, align 4, !tbaa !16
  store i32 %52, i32 addrspace(1)* %48, align 4, !tbaa !16
  %54 = add nuw nsw i32 %39, 1
  %55 = add i32 %40, 1
  %56 = icmp eq i32 %55, %27
  br i1 %56, label %57, label %38, !llvm.loop !20

57:                                               ; preds = %36, %38, %31
  %58 = add nsw i32 %32, %23
  %59 = icmp ult i32 %58, %0
  br i1 %59, label %31, label %35, !llvm.loop !22

60:                                               ; preds = %33, %60
  %61 = phi i32 [ %118, %60 ], [ 0, %33 ]
  %62 = phi i32 [ %119, %60 ], [ 0, %33 ]
  %63 = add i32 %61, %34
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !16
  %67 = tail call i32 @llvm.smax.i32(i32 %66, i32 %61)
  %68 = add i32 %67, %34
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !16
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %64
  store i32 %71, i32 addrspace(1)* %72, align 4, !tbaa !16
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %64
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !16
  %75 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !16
  store i32 %75, i32 addrspace(1)* %73, align 4, !tbaa !16
  store i32 %74, i32 addrspace(1)* %70, align 4, !tbaa !16
  %76 = or i32 %61, 1
  %77 = add i32 %76, %34
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !16
  %81 = tail call i32 @llvm.smax.i32(i32 %80, i32 %76)
  %82 = add i32 %81, %34
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !16
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %78
  store i32 %85, i32 addrspace(1)* %86, align 4, !tbaa !16
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %78
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !16
  %89 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !16
  store i32 %89, i32 addrspace(1)* %87, align 4, !tbaa !16
  store i32 %88, i32 addrspace(1)* %84, align 4, !tbaa !16
  %90 = or i32 %61, 2
  %91 = add i32 %90, %34
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !16
  %95 = tail call i32 @llvm.smax.i32(i32 %94, i32 %90)
  %96 = add i32 %95, %34
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !16
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %92
  store i32 %99, i32 addrspace(1)* %100, align 4, !tbaa !16
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %92
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !16
  %103 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !16
  store i32 %103, i32 addrspace(1)* %101, align 4, !tbaa !16
  store i32 %102, i32 addrspace(1)* %98, align 4, !tbaa !16
  %104 = or i32 %61, 3
  %105 = add i32 %104, %34
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !16
  %109 = tail call i32 @llvm.smax.i32(i32 %108, i32 %104)
  %110 = add i32 %109, %34
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !16
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %106
  store i32 %113, i32 addrspace(1)* %114, align 4, !tbaa !16
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %106
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !16
  %117 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !16
  store i32 %117, i32 addrspace(1)* %115, align 4, !tbaa !16
  store i32 %116, i32 addrspace(1)* %112, align 4, !tbaa !16
  %118 = add nuw nsw i32 %61, 4
  %119 = add i32 %62, 4
  %120 = icmp eq i32 %119, %29
  br i1 %120, label %36, label %60, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
