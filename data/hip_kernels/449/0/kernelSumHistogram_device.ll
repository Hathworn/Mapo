; ModuleID = '../data/hip_kernels/449/0/main.cu'
source_filename = "../data/hip_kernels/449/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18kernelSumHistogramPyS_iii(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = mul i32 %7, %12
  %17 = add i32 %16, %6
  %18 = freeze i32 %2
  %19 = freeze i32 %4
  %20 = sdiv i32 %18, %19
  %21 = mul i32 %20, %19
  %22 = sub i32 %18, %21
  %23 = icmp ne i32 %22, 0
  %24 = zext i1 %23 to i32
  %25 = add i32 %20, %24
  %26 = icmp slt i32 %17, %3
  br i1 %26, label %27, label %121

27:                                               ; preds = %5
  %28 = icmp eq i32 %25, 0
  %29 = udiv i32 %15, %12
  %30 = mul i32 %29, %12
  %31 = icmp ugt i32 %15, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %12
  %35 = add i32 %20, %24
  %36 = add i32 %35, -1
  %37 = and i32 %25, 7
  %38 = icmp ult i32 %36, 7
  %39 = and i32 %25, -8
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %27, %62
  %42 = phi i32 [ %17, %27 ], [ %65, %62 ]
  %43 = sext i32 %42 to i64
  br i1 %28, label %62, label %44

44:                                               ; preds = %41
  %45 = getelementptr i64, i64 addrspace(1)* %0, i64 %43
  br i1 %38, label %46, label %67

46:                                               ; preds = %67, %44
  %47 = phi i64 [ undef, %44 ], [ %117, %67 ]
  %48 = phi i32 [ 0, %44 ], [ %118, %67 ]
  %49 = phi i64 [ 0, %44 ], [ %117, %67 ]
  br i1 %40, label %62, label %50

50:                                               ; preds = %46, %50
  %51 = phi i32 [ %59, %50 ], [ %48, %46 ]
  %52 = phi i64 [ %58, %50 ], [ %49, %46 ]
  %53 = phi i32 [ %60, %50 ], [ 0, %46 ]
  %54 = mul nsw i32 %51, %3
  %55 = sext i32 %54 to i64
  %56 = getelementptr i64, i64 addrspace(1)* %45, i64 %55
  %57 = load i64, i64 addrspace(1)* %56, align 8, !tbaa !16
  %58 = add i64 %57, %52
  %59 = add nuw nsw i32 %51, 1
  %60 = add i32 %53, 1
  %61 = icmp eq i32 %60, %37
  br i1 %61, label %62, label %50, !llvm.loop !20

62:                                               ; preds = %46, %50, %41
  %63 = phi i64 [ 0, %41 ], [ %47, %46 ], [ %58, %50 ]
  %64 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %43
  store i64 %63, i64 addrspace(1)* %64, align 8, !tbaa !16
  %65 = add i32 %34, %42
  %66 = icmp slt i32 %65, %3
  br i1 %66, label %41, label %121, !llvm.loop !22

67:                                               ; preds = %44, %67
  %68 = phi i32 [ %118, %67 ], [ 0, %44 ]
  %69 = phi i64 [ %117, %67 ], [ 0, %44 ]
  %70 = phi i32 [ %119, %67 ], [ 0, %44 ]
  %71 = mul nsw i32 %68, %3
  %72 = sext i32 %71 to i64
  %73 = getelementptr i64, i64 addrspace(1)* %45, i64 %72
  %74 = load i64, i64 addrspace(1)* %73, align 8, !tbaa !16
  %75 = add i64 %74, %69
  %76 = or i32 %68, 1
  %77 = mul nsw i32 %76, %3
  %78 = sext i32 %77 to i64
  %79 = getelementptr i64, i64 addrspace(1)* %45, i64 %78
  %80 = load i64, i64 addrspace(1)* %79, align 8, !tbaa !16
  %81 = add i64 %80, %75
  %82 = or i32 %68, 2
  %83 = mul nsw i32 %82, %3
  %84 = sext i32 %83 to i64
  %85 = getelementptr i64, i64 addrspace(1)* %45, i64 %84
  %86 = load i64, i64 addrspace(1)* %85, align 8, !tbaa !16
  %87 = add i64 %86, %81
  %88 = or i32 %68, 3
  %89 = mul nsw i32 %88, %3
  %90 = sext i32 %89 to i64
  %91 = getelementptr i64, i64 addrspace(1)* %45, i64 %90
  %92 = load i64, i64 addrspace(1)* %91, align 8, !tbaa !16
  %93 = add i64 %92, %87
  %94 = or i32 %68, 4
  %95 = mul nsw i32 %94, %3
  %96 = sext i32 %95 to i64
  %97 = getelementptr i64, i64 addrspace(1)* %45, i64 %96
  %98 = load i64, i64 addrspace(1)* %97, align 8, !tbaa !16
  %99 = add i64 %98, %93
  %100 = or i32 %68, 5
  %101 = mul nsw i32 %100, %3
  %102 = sext i32 %101 to i64
  %103 = getelementptr i64, i64 addrspace(1)* %45, i64 %102
  %104 = load i64, i64 addrspace(1)* %103, align 8, !tbaa !16
  %105 = add i64 %104, %99
  %106 = or i32 %68, 6
  %107 = mul nsw i32 %106, %3
  %108 = sext i32 %107 to i64
  %109 = getelementptr i64, i64 addrspace(1)* %45, i64 %108
  %110 = load i64, i64 addrspace(1)* %109, align 8, !tbaa !16
  %111 = add i64 %110, %105
  %112 = or i32 %68, 7
  %113 = mul nsw i32 %112, %3
  %114 = sext i32 %113 to i64
  %115 = getelementptr i64, i64 addrspace(1)* %45, i64 %114
  %116 = load i64, i64 addrspace(1)* %115, align 8, !tbaa !16
  %117 = add i64 %116, %111
  %118 = add nuw nsw i32 %68, 8
  %119 = add i32 %70, 8
  %120 = icmp eq i32 %119, %39
  br i1 %120, label %46, label %67, !llvm.loop !24

121:                                              ; preds = %62, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
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
!17 = !{!"long long", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
