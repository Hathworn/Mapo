; ModuleID = '../data/hip_kernels/10553/2/main.cu'
source_filename = "../data/hip_kernels/10553/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.chromosome = type <{ i64, i64, [100003 x i8], [5 x i8] }>

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3ganP10chromosomeS0_i(%struct.chromosome addrspace(1)* nocapture %0, %struct.chromosome addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, 50
  br i1 %13, label %14, label %37

14:                                               ; preds = %3
  %15 = sext i32 %2 to i64
  %16 = sext i32 %12 to i64
  %17 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16, i32 1
  %18 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16
  %19 = bitcast %struct.chromosome addrspace(1)* %18 to i8 addrspace(1)*
  br label %20

20:                                               ; preds = %14, %34
  %21 = phi i32 [ %12, %14 ], [ %35, %34 ]
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %1, i64 %22
  %24 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %23, i64 0, i32 0
  %25 = load i64, i64 addrspace(1)* %24, align 8, !tbaa !7
  %26 = icmp sgt i64 %25, %15
  br i1 %26, label %34, label %27

27:                                               ; preds = %20
  %28 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %1, i64 %22, i32 1
  %29 = load i64, i64 addrspace(1)* %28, align 8, !tbaa !12
  %30 = load i64, i64 addrspace(1)* %17, align 8, !tbaa !12
  %31 = icmp sgt i64 %29, %30
  br i1 %31, label %32, label %34

32:                                               ; preds = %27
  %33 = bitcast %struct.chromosome addrspace(1)* %23 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 8 dereferenceable(100019) %19, i8 addrspace(1)* noundef align 8 dereferenceable(100019) %33, i64 100019, i1 false), !tbaa.struct !13
  br label %34

34:                                               ; preds = %20, %27, %32
  %35 = add nsw i32 %21, 50
  %36 = icmp slt i32 %21, 50
  br i1 %36, label %20, label %37, !llvm.loop !16

37:                                               ; preds = %34, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }

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
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTS10chromosome", !9, i64 0, !9, i64 8, !10, i64 16}
!9 = !{!"long long", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!8, !9, i64 8}
!13 = !{i64 0, i64 8, !14, i64 8, i64 8, !14, i64 16, i64 100003, !15}
!14 = !{!9, !9, i64 0}
!15 = !{!10, !10, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
