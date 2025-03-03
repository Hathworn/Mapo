; ModuleID = '../data/hip_kernels/15208/3/main.cu'
source_filename = "../data/hip_kernels/15208/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z16gpu_get_neighorsPiii(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %6 = bitcast i8 addrspace(4)* %5 to i32 addrspace(4)*
  %7 = load i32, i32 addrspace(4)* %6, align 4, !tbaa !4
  %8 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !13, !invariant.load !14
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %7, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %7, %13
  %15 = zext i1 %14 to i32
  %16 = add i32 %12, %15
  %17 = udiv i32 %1, %16
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %40, label %19

19:                                               ; preds = %3
  %20 = udiv i32 %1, %11
  %21 = icmp eq i32 %20, -1
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %24 = sdiv i32 %2, 2
  %25 = shl nsw i32 %24, 1
  %26 = add nuw nsw i32 %25, 1
  %27 = and i32 %26, 7
  %28 = icmp ult i32 %25, 7
  %29 = and i32 %26, -8
  br label %30

30:                                               ; preds = %19, %41
  %31 = phi i32 [ 0, %19 ], [ %42, %41 ]
  br i1 %21, label %41, label %32

32:                                               ; preds = %30
  %33 = mul i32 %16, %31
  %34 = add i32 %33, %22
  %35 = icmp sge i32 %34, %1
  %36 = sub nsw i32 %34, %24
  %37 = add nsw i32 %34, %24
  %38 = icmp sgt i32 %36, %37
  %39 = mul nsw i32 %34, %1
  br label %44

40:                                               ; preds = %41, %3
  ret void

41:                                               ; preds = %157, %30
  %42 = add nuw nsw i32 %31, 1
  %43 = icmp eq i32 %31, %17
  br i1 %43, label %40, label %30, !llvm.loop !15

44:                                               ; preds = %32, %157
  %45 = phi i32 [ 0, %32 ], [ %158, %157 ]
  %46 = mul i32 %45, %11
  %47 = add i32 %46, %23
  %48 = icmp sge i32 %47, %1
  %49 = select i1 %35, i1 true, i1 %48
  %50 = select i1 %49, i1 true, i1 %38
  br i1 %50, label %157, label %51

51:                                               ; preds = %44
  %52 = sub nsw i32 %47, %24
  %53 = add nsw i32 %47, %24
  %54 = icmp sgt i32 %52, %53
  %55 = add i32 %47, %39
  %56 = mul i32 %55, %2
  br label %57

57:                                               ; preds = %51, %83
  %58 = phi i32 [ %36, %51 ], [ %85, %83 ]
  %59 = phi i32 [ 0, %51 ], [ %84, %83 ]
  br i1 %54, label %83, label %60

60:                                               ; preds = %57
  %61 = add i32 %59, %56
  %62 = mul i32 %61, %2
  %63 = add nsw i32 %58, %1
  %64 = srem i32 %63, %1
  %65 = mul nsw i32 %64, %1
  br i1 %28, label %66, label %87

66:                                               ; preds = %60, %87
  %67 = phi i32 [ %52, %60 ], [ %154, %87 ]
  %68 = phi i32 [ 0, %60 ], [ %153, %87 ]
  br label %69

69:                                               ; preds = %69, %66
  %70 = phi i32 [ %67, %66 ], [ %80, %69 ]
  %71 = phi i32 [ %68, %66 ], [ %79, %69 ]
  %72 = phi i32 [ 0, %66 ], [ %81, %69 ]
  %73 = add nsw i32 %71, %62
  %74 = add nsw i32 %70, %1
  %75 = srem i32 %74, %1
  %76 = add nsw i32 %65, %75
  %77 = sext i32 %73 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  store i32 %76, i32 addrspace(1)* %78, align 4, !tbaa !17
  %79 = add nuw i32 %71, 1
  %80 = add nsw i32 %70, 1
  %81 = add i32 %72, 1
  %82 = icmp eq i32 %81, %27
  br i1 %82, label %83, label %69, !llvm.loop !21

83:                                               ; preds = %69, %57
  %84 = add nuw i32 %59, 1
  %85 = add nsw i32 %58, 1
  %86 = icmp eq i32 %59, %25
  br i1 %86, label %157, label %57, !llvm.loop !23

87:                                               ; preds = %60, %87
  %88 = phi i32 [ %154, %87 ], [ %52, %60 ]
  %89 = phi i32 [ %153, %87 ], [ 0, %60 ]
  %90 = phi i32 [ %155, %87 ], [ 0, %60 ]
  %91 = add nsw i32 %89, %62
  %92 = add nsw i32 %88, %1
  %93 = srem i32 %92, %1
  %94 = add nsw i32 %65, %93
  %95 = sext i32 %91 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  store i32 %94, i32 addrspace(1)* %96, align 4, !tbaa !17
  %97 = or i32 %89, 1
  %98 = add nsw i32 %88, 1
  %99 = add nsw i32 %97, %62
  %100 = add nsw i32 %98, %1
  %101 = srem i32 %100, %1
  %102 = add nsw i32 %65, %101
  %103 = sext i32 %99 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %103
  store i32 %102, i32 addrspace(1)* %104, align 4, !tbaa !17
  %105 = or i32 %89, 2
  %106 = add nsw i32 %88, 2
  %107 = add nsw i32 %105, %62
  %108 = add nsw i32 %106, %1
  %109 = srem i32 %108, %1
  %110 = add nsw i32 %65, %109
  %111 = sext i32 %107 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %111
  store i32 %110, i32 addrspace(1)* %112, align 4, !tbaa !17
  %113 = or i32 %89, 3
  %114 = add nsw i32 %88, 3
  %115 = add nsw i32 %113, %62
  %116 = add nsw i32 %114, %1
  %117 = srem i32 %116, %1
  %118 = add nsw i32 %65, %117
  %119 = sext i32 %115 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %119
  store i32 %118, i32 addrspace(1)* %120, align 4, !tbaa !17
  %121 = or i32 %89, 4
  %122 = add nsw i32 %88, 4
  %123 = add nsw i32 %121, %62
  %124 = add nsw i32 %122, %1
  %125 = srem i32 %124, %1
  %126 = add nsw i32 %65, %125
  %127 = sext i32 %123 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %127
  store i32 %126, i32 addrspace(1)* %128, align 4, !tbaa !17
  %129 = or i32 %89, 5
  %130 = add nsw i32 %88, 5
  %131 = add nsw i32 %129, %62
  %132 = add nsw i32 %130, %1
  %133 = srem i32 %132, %1
  %134 = add nsw i32 %65, %133
  %135 = sext i32 %131 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %135
  store i32 %134, i32 addrspace(1)* %136, align 4, !tbaa !17
  %137 = or i32 %89, 6
  %138 = add nsw i32 %88, 6
  %139 = add nsw i32 %137, %62
  %140 = add nsw i32 %138, %1
  %141 = srem i32 %140, %1
  %142 = add nsw i32 %65, %141
  %143 = sext i32 %139 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %143
  store i32 %142, i32 addrspace(1)* %144, align 4, !tbaa !17
  %145 = or i32 %89, 7
  %146 = add nsw i32 %88, 7
  %147 = add nsw i32 %145, %62
  %148 = add nsw i32 %146, %1
  %149 = srem i32 %148, %1
  %150 = add nsw i32 %65, %149
  %151 = sext i32 %147 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %151
  store i32 %150, i32 addrspace(1)* %152, align 4, !tbaa !17
  %153 = add nuw i32 %89, 8
  %154 = add nsw i32 %88, 8
  %155 = add i32 %90, 8
  %156 = icmp eq i32 %155, %29
  br i1 %156, label %66, label %87, !llvm.loop !24

157:                                              ; preds = %83, %44
  %158 = add nuw nsw i32 %45, 1
  %159 = icmp eq i32 %45, %20
  br i1 %159, label %41, label %44, !llvm.loop !25
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
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = distinct !{!23, !16}
!24 = distinct !{!24, !16}
!25 = distinct !{!25, !16}
