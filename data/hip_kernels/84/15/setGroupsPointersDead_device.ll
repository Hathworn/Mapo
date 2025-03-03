; ModuleID = '../data/hip_kernels/84/15/main.cu'
source_filename = "../data/hip_kernels/84/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.multipassConfig_t = type { i32*, i32*, i8*, i32*, i32*, i8*, i64, i64, i8*, i8*, i8*, %struct.page_t*, %struct.page_t*, i8*, i8*, %struct.bucketGroup_t*, %struct.hashBucket_t**, i32*, i16*, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.page_t = type { %struct.page_t*, i32, i16, i16 }
%struct.bucketGroup_t = type { %struct.page_t*, i32, i32 }
%struct.hashBucket_t = type { %struct.hashBucket_t*, i16, i16, i16, i16 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21setGroupsPointersDeadP17multipassConfig_tj(%struct.multipassConfig_t addrspace(1)* nocapture readonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 16
  %5 = bitcast i8 addrspace(4)* %4 to i32 addrspace(4)*
  %6 = load i32, i32 addrspace(4)* %5, align 8, !tbaa !4
  %7 = getelementptr i8, i8 addrspace(4)* %3, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !13, !invariant.load !14
  %10 = zext i16 %9 to i32
  %11 = udiv i32 %6, %10
  %12 = mul i32 %11, %10
  %13 = icmp ugt i32 %6, %12
  %14 = zext i1 %13 to i32
  %15 = add i32 %11, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = add i32 %17, %18
  %20 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !13, !invariant.load !14
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = icmp ult i32 %26, %1
  br i1 %27, label %28, label %34

28:                                               ; preds = %2
  %29 = getelementptr inbounds %struct.multipassConfig_t, %struct.multipassConfig_t addrspace(1)* %0, i64 0, i32 18
  %30 = load i16*, i16* addrspace(1)* %29, align 8, !tbaa !16, !amdgpu.noclobber !14
  %31 = sext i32 %26 to i64
  %32 = getelementptr inbounds i16, i16* %30, i64 %31
  %33 = addrspacecast i16* %32 to i16 addrspace(1)*
  store i16 1, i16 addrspace(1)* %33, align 2, !tbaa !24
  br label %34

34:                                               ; preds = %28, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 16}
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
!16 = !{!17, !18, i64 144}
!17 = !{!"_ZTS17multipassConfig_t", !18, i64 0, !18, i64 8, !18, i64 16, !18, i64 24, !18, i64 32, !18, i64 40, !21, i64 48, !22, i64 56, !18, i64 64, !18, i64 72, !18, i64 80, !18, i64 88, !18, i64 96, !18, i64 104, !18, i64 112, !18, i64 120, !18, i64 128, !18, i64 136, !18, i64 144, !21, i64 152, !23, i64 160, !23, i64 164, !23, i64 168, !23, i64 172, !23, i64 176, !23, i64 180, !23, i64 184, !23, i64 188, !23, i64 192, !23, i64 196}
!18 = !{!"any pointer", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!"long long", !19, i64 0}
!22 = !{!"long", !19, i64 0}
!23 = !{!"int", !19, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"short", !19, i64 0}
