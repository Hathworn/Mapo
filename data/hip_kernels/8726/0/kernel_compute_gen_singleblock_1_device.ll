; ModuleID = '../data/hip_kernels/8726/0/main.cu'
source_filename = "../data/hip_kernels/8726/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z32kernel_compute_gen_singleblock_1PhS_jjj(i8 addrspace(1)* %0, i8 addrspace(1)* %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %3, -1
  %8 = and i32 %7, %6
  %9 = add nsw i32 %8, -1
  %10 = and i32 %9, %7
  %11 = add nuw nsw i32 %8, 1
  %12 = and i32 %11, %7
  %13 = sub nsw i32 %6, %8
  %14 = sub i32 %13, %3
  %15 = and i32 %14, %2
  %16 = add i32 %13, %3
  %17 = and i32 %16, %2
  %18 = icmp eq i32 %4, 0
  br i1 %18, label %39, label %19

19:                                               ; preds = %5
  %20 = addrspacecast i8 addrspace(1)* %1 to i8*
  %21 = addrspacecast i8 addrspace(1)* %0 to i8*
  %22 = add i32 %15, %10
  %23 = zext i32 %22 to i64
  %24 = add i32 %15, %8
  %25 = zext i32 %24 to i64
  %26 = add i32 %15, %12
  %27 = zext i32 %26 to i64
  %28 = add i32 %10, %13
  %29 = zext i32 %28 to i64
  %30 = add nsw i32 %12, %13
  %31 = zext i32 %30 to i64
  %32 = add i32 %17, %10
  %33 = zext i32 %32 to i64
  %34 = add i32 %17, %8
  %35 = zext i32 %34 to i64
  %36 = add i32 %17, %12
  %37 = zext i32 %36 to i64
  %38 = zext i32 %6 to i64
  br label %40

39:                                               ; preds = %72, %5
  ret void

40:                                               ; preds = %19, %72
  %41 = phi i32 [ 0, %19 ], [ %76, %72 ]
  %42 = phi i8* [ %20, %19 ], [ %43, %72 ]
  %43 = phi i8* [ %21, %19 ], [ %42, %72 ]
  %44 = getelementptr inbounds i8, i8* %43, i64 %23
  %45 = load i8, i8* %44, align 1, !tbaa !5
  %46 = getelementptr inbounds i8, i8* %43, i64 %25
  %47 = load i8, i8* %46, align 1, !tbaa !5
  %48 = add i8 %47, %45
  %49 = getelementptr inbounds i8, i8* %43, i64 %27
  %50 = load i8, i8* %49, align 1, !tbaa !5
  %51 = add i8 %48, %50
  %52 = getelementptr inbounds i8, i8* %43, i64 %29
  %53 = load i8, i8* %52, align 1, !tbaa !5
  %54 = add i8 %51, %53
  %55 = getelementptr inbounds i8, i8* %43, i64 %31
  %56 = load i8, i8* %55, align 1, !tbaa !5
  %57 = add i8 %54, %56
  %58 = getelementptr inbounds i8, i8* %43, i64 %33
  %59 = load i8, i8* %58, align 1, !tbaa !5
  %60 = add i8 %57, %59
  %61 = getelementptr inbounds i8, i8* %43, i64 %35
  %62 = load i8, i8* %61, align 1, !tbaa !5
  %63 = add i8 %60, %62
  %64 = getelementptr inbounds i8, i8* %43, i64 %37
  %65 = load i8, i8* %64, align 1, !tbaa !5
  %66 = add i8 %63, %65
  switch i8 %66, label %71 [
    i8 3, label %72
    i8 2, label %67
  ]

67:                                               ; preds = %40
  %68 = getelementptr inbounds i8, i8* %43, i64 %38
  %69 = load i8, i8* %68, align 1, !tbaa !5
  %70 = icmp ne i8 %69, 0
  br label %72

71:                                               ; preds = %40
  br label %72

72:                                               ; preds = %40, %71, %67
  %73 = phi i1 [ true, %40 ], [ %70, %67 ], [ false, %71 ]
  %74 = zext i1 %73 to i8
  %75 = getelementptr inbounds i8, i8* %42, i64 %38
  store i8 %74, i8* %75, align 1, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = add nuw i32 %41, 1
  %77 = icmp eq i32 %76, %4
  br i1 %77, label %39, label %40, !llvm.loop !8
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
