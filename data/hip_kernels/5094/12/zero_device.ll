; ModuleID = '../data/hip_kernels/5094/12/main.cu'
source_filename = "../data/hip_kernels/5094/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z4zeroiiiPd(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul nsw i32 %1, %0
  %14 = mul nsw i32 %13, %2
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 8, !tbaa !15
  %23 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %22, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %22, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %19
  %33 = udiv i32 %14, %32
  %34 = sdiv i32 %33, %9
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %61

36:                                               ; preds = %4
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %38 = mul i32 %19, %37
  %39 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %40 = add i32 %38, %39
  %41 = mul i32 %40, %33
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %43 = add nsw i32 %41, %42
  %44 = and i32 %34, 7
  %45 = icmp ult i32 %34, 8
  br i1 %45, label %48, label %46

46:                                               ; preds = %36
  %47 = and i32 %34, -8
  br label %62

48:                                               ; preds = %62, %36
  %49 = phi i32 [ 0, %36 ], [ %104, %62 ]
  %50 = icmp eq i32 %44, 0
  br i1 %50, label %61, label %51

51:                                               ; preds = %48, %51
  %52 = phi i32 [ %58, %51 ], [ %49, %48 ]
  %53 = phi i32 [ %59, %51 ], [ 0, %48 ]
  %54 = mul nuw nsw i32 %52, %9
  %55 = add nsw i32 %43, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %3, i64 %56
  store double 0.000000e+00, double addrspace(1)* %57, align 8, !tbaa !17
  %58 = add nuw nsw i32 %52, 1
  %59 = add i32 %53, 1
  %60 = icmp eq i32 %59, %44
  br i1 %60, label %61, label %51, !llvm.loop !21

61:                                               ; preds = %48, %51, %4
  ret void

62:                                               ; preds = %62, %46
  %63 = phi i32 [ 0, %46 ], [ %104, %62 ]
  %64 = phi i32 [ 0, %46 ], [ %105, %62 ]
  %65 = mul nuw nsw i32 %63, %9
  %66 = add nsw i32 %43, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %3, i64 %67
  store double 0.000000e+00, double addrspace(1)* %68, align 8, !tbaa !17
  %69 = or i32 %63, 1
  %70 = mul nuw nsw i32 %69, %9
  %71 = add nsw i32 %43, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %3, i64 %72
  store double 0.000000e+00, double addrspace(1)* %73, align 8, !tbaa !17
  %74 = or i32 %63, 2
  %75 = mul nuw nsw i32 %74, %9
  %76 = add nsw i32 %43, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %3, i64 %77
  store double 0.000000e+00, double addrspace(1)* %78, align 8, !tbaa !17
  %79 = or i32 %63, 3
  %80 = mul nuw nsw i32 %79, %9
  %81 = add nsw i32 %43, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %3, i64 %82
  store double 0.000000e+00, double addrspace(1)* %83, align 8, !tbaa !17
  %84 = or i32 %63, 4
  %85 = mul nuw nsw i32 %84, %9
  %86 = add nsw i32 %43, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %3, i64 %87
  store double 0.000000e+00, double addrspace(1)* %88, align 8, !tbaa !17
  %89 = or i32 %63, 5
  %90 = mul nuw nsw i32 %89, %9
  %91 = add nsw i32 %43, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %3, i64 %92
  store double 0.000000e+00, double addrspace(1)* %93, align 8, !tbaa !17
  %94 = or i32 %63, 6
  %95 = mul nuw nsw i32 %94, %9
  %96 = add nsw i32 %43, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %3, i64 %97
  store double 0.000000e+00, double addrspace(1)* %98, align 8, !tbaa !17
  %99 = or i32 %63, 7
  %100 = mul nuw nsw i32 %99, %9
  %101 = add nsw i32 %43, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %3, i64 %102
  store double 0.000000e+00, double addrspace(1)* %103, align 8, !tbaa !17
  %104 = add nuw nsw i32 %63, 8
  %105 = add i32 %64, 8
  %106 = icmp eq i32 %105, %47
  br i1 %106, label %48, label %62, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!15 = !{!7, !11, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
