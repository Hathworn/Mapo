; ModuleID = '../data/hip_kernels/8742/1/main.cu'
source_filename = "../data/hip_kernels/8742/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z30kernel_compute_gen_singleblockPhS_jjjj(i8 addrspace(1)* %0, i8 addrspace(1)* %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = mul i32 %7, %5
  %9 = add i32 %8, %5
  %10 = icmp eq i32 %4, 0
  br i1 %10, label %20, label %11

11:                                               ; preds = %6
  %12 = addrspacecast i8 addrspace(1)* %1 to i8*
  %13 = addrspacecast i8 addrspace(1)* %0 to i8*
  %14 = icmp ult i32 %8, %9
  %15 = add i32 %3, -1
  br label %16

16:                                               ; preds = %11, %21
  %17 = phi i32 [ 0, %11 ], [ %22, %21 ]
  %18 = phi i8* [ %12, %11 ], [ %19, %21 ]
  %19 = phi i8* [ %13, %11 ], [ %18, %21 ]
  br i1 %14, label %24, label %21

20:                                               ; preds = %21, %6
  ret void

21:                                               ; preds = %81, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = add nuw i32 %17, 1
  %23 = icmp eq i32 %22, %4
  br i1 %23, label %20, label %16, !llvm.loop !5

24:                                               ; preds = %16, %81
  %25 = phi i32 [ %86, %81 ], [ %8, %16 ]
  %26 = and i32 %25, %15
  %27 = add i32 %26, -1
  %28 = and i32 %27, %15
  %29 = add nuw i32 %26, 1
  %30 = and i32 %29, %15
  %31 = sub i32 %25, %26
  %32 = sub i32 %31, %3
  %33 = and i32 %32, %2
  %34 = add i32 %31, %3
  %35 = and i32 %34, %2
  %36 = add i32 %33, %28
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %19, i64 %37
  %39 = load i8, i8* %38, align 1, !tbaa !7
  %40 = add i32 %33, %26
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8* %19, i64 %41
  %43 = load i8, i8* %42, align 1, !tbaa !7
  %44 = add i8 %43, %39
  %45 = add i32 %33, %30
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %19, i64 %46
  %48 = load i8, i8* %47, align 1, !tbaa !7
  %49 = add i8 %44, %48
  %50 = add i32 %28, %31
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %19, i64 %51
  %53 = load i8, i8* %52, align 1, !tbaa !7
  %54 = add i8 %49, %53
  %55 = add i32 %30, %31
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %19, i64 %56
  %58 = load i8, i8* %57, align 1, !tbaa !7
  %59 = add i8 %54, %58
  %60 = add i32 %35, %28
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8* %19, i64 %61
  %63 = load i8, i8* %62, align 1, !tbaa !7
  %64 = add i8 %59, %63
  %65 = add i32 %35, %26
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %19, i64 %66
  %68 = load i8, i8* %67, align 1, !tbaa !7
  %69 = add i8 %64, %68
  %70 = add i32 %35, %30
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8* %19, i64 %71
  %73 = load i8, i8* %72, align 1, !tbaa !7
  %74 = add i8 %69, %73
  switch i8 %74, label %80 [
    i8 3, label %81
    i8 2, label %75
  ]

75:                                               ; preds = %24
  %76 = zext i32 %25 to i64
  %77 = getelementptr inbounds i8, i8* %19, i64 %76
  %78 = load i8, i8* %77, align 1, !tbaa !7
  %79 = icmp ne i8 %78, 0
  br label %81

80:                                               ; preds = %24
  br label %81

81:                                               ; preds = %24, %80, %75
  %82 = phi i1 [ true, %24 ], [ %79, %75 ], [ false, %80 ]
  %83 = zext i1 %82 to i8
  %84 = zext i32 %25 to i64
  %85 = getelementptr inbounds i8, i8* %18, i64 %84
  store i8 %83, i8* %85, align 1, !tbaa !7
  %86 = add nuw i32 %25, 1
  %87 = icmp eq i32 %86, %9
  br i1 %87, label %21, label %24, !llvm.loop !10
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !6}
