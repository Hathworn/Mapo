; ModuleID = '../data/hip_kernels/10553/1/main.cu'
source_filename = "../data/hip_kernels/10553/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.chromosome = type <{ i64, i64, [100003 x i8], [5 x i8] }>

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7initOneP10chromosomeiPiS1_(%struct.chromosome addrspace(1)* nocapture writeonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = icmp ult i32 %5, 50
  br i1 %6, label %7, label %29

7:                                                ; preds = %4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul nuw nsw i32 %5, %13
  %15 = add nuw nsw i32 %14, %8
  %16 = srem i32 %15, %1
  %17 = icmp eq i32 %5, %16
  %18 = zext i32 %5 to i64
  br i1 %17, label %19, label %26

19:                                               ; preds = %7
  %20 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %18, i32 2, i64 %18
  store i8 1, i8 addrspace(1)* %20, align 1, !tbaa !7
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !11, !amdgpu.noclobber !6
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %18, i32 1
  store i64 %23, i64 addrspace(1)* %24, align 8, !tbaa !13
  %25 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %18, i32 0
  store i64 %23, i64 addrspace(1)* %25, align 8, !tbaa !16
  br label %29

26:                                               ; preds = %7
  %27 = zext i32 %16 to i64
  %28 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %18, i32 2, i64 %27
  store i8 0, i8 addrspace(1)* %28, align 1, !tbaa !7
  br label %29

29:                                               ; preds = %19, %26, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!14, !15, i64 8}
!14 = !{!"_ZTS10chromosome", !15, i64 0, !15, i64 8, !9, i64 16}
!15 = !{!"long long", !9, i64 0}
!16 = !{!14, !15, i64 0}
