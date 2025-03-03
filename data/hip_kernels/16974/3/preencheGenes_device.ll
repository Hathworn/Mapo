; ModuleID = '../data/hip_kernels/16974/3/main.cu'
source_filename = "../data/hip_kernels/16974/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z13preencheGenesjjPi(i32 %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %15, %0
  br i1 %22, label %23, label %33

23:                                               ; preds = %3
  %24 = icmp eq i32 %1, 0
  %25 = and i32 %1, 7
  %26 = icmp ult i32 %1, 8
  %27 = and i32 %1, -8
  %28 = icmp eq i32 %25, 0
  br label %29

29:                                               ; preds = %23, %45
  %30 = phi i32 [ %15, %23 ], [ %46, %45 ]
  br i1 %24, label %45, label %31

31:                                               ; preds = %29
  %32 = mul i32 %30, %1
  br i1 %26, label %34, label %48

33:                                               ; preds = %45, %3
  ret void

34:                                               ; preds = %48, %31
  %35 = phi i32 [ 0, %31 ], [ %82, %48 ]
  br i1 %28, label %45, label %36

36:                                               ; preds = %34, %36
  %37 = phi i32 [ %42, %36 ], [ %35, %34 ]
  %38 = phi i32 [ %43, %36 ], [ 0, %34 ]
  %39 = add i32 %37, %32
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  store i32 %37, i32 addrspace(1)* %41, align 4, !tbaa !16
  %42 = add nuw nsw i32 %37, 1
  %43 = add i32 %38, 1
  %44 = icmp eq i32 %43, %25
  br i1 %44, label %45, label %36, !llvm.loop !20

45:                                               ; preds = %34, %36, %29
  %46 = add nsw i32 %30, %21
  %47 = icmp ult i32 %46, %0
  br i1 %47, label %29, label %33, !llvm.loop !22

48:                                               ; preds = %31, %48
  %49 = phi i32 [ %82, %48 ], [ 0, %31 ]
  %50 = phi i32 [ %83, %48 ], [ 0, %31 ]
  %51 = add i32 %49, %32
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %52
  store i32 %49, i32 addrspace(1)* %53, align 4, !tbaa !16
  %54 = or i32 %49, 1
  %55 = add i32 %54, %32
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %56
  store i32 %54, i32 addrspace(1)* %57, align 4, !tbaa !16
  %58 = or i32 %49, 2
  %59 = add i32 %58, %32
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  store i32 %58, i32 addrspace(1)* %61, align 4, !tbaa !16
  %62 = or i32 %49, 3
  %63 = add i32 %62, %32
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %64
  store i32 %62, i32 addrspace(1)* %65, align 4, !tbaa !16
  %66 = or i32 %49, 4
  %67 = add i32 %66, %32
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  store i32 %66, i32 addrspace(1)* %69, align 4, !tbaa !16
  %70 = or i32 %49, 5
  %71 = add i32 %70, %32
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %72
  store i32 %70, i32 addrspace(1)* %73, align 4, !tbaa !16
  %74 = or i32 %49, 6
  %75 = add i32 %74, %32
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  store i32 %74, i32 addrspace(1)* %77, align 4, !tbaa !16
  %78 = or i32 %49, 7
  %79 = add i32 %78, %32
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %80
  store i32 %78, i32 addrspace(1)* %81, align 4, !tbaa !16
  %82 = add nuw nsw i32 %49, 8
  %83 = add i32 %50, 8
  %84 = icmp eq i32 %83, %27
  br i1 %84, label %34, label %48, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
