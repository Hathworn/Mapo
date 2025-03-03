; ModuleID = '../data/hip_kernels/4212/19/main.cu'
source_filename = "../data/hip_kernels/4212/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z18kernel_test0_writePcS_jPjPmS1_S1_S1_(i8 addrspace(1)* writeonly %0, i8 addrspace(1)* readnone %1, i32 %2, i32 addrspace(1)* nocapture readnone %3, i64 addrspace(1)* nocapture readnone %4, i64 addrspace(1)* nocapture readnone %5, i64 addrspace(1)* nocapture readnone %6, i64 addrspace(1)* nocapture readnone %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 20
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %11
  %13 = bitcast i8 addrspace(1)* %12 to i32 addrspace(1)*
  %14 = icmp ult i8 addrspace(1)* %12, %1
  br i1 %14, label %15, label %114

15:                                               ; preds = %8, %15
  %16 = phi i32 [ %112, %15 ], [ 0, %8 ]
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %17
  store i32 %2, i32 addrspace(1)* %18, align 4, !tbaa !4
  %19 = or i32 %16, 1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %20
  store i32 %2, i32 addrspace(1)* %21, align 4, !tbaa !4
  %22 = or i32 %16, 2
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %23
  store i32 %2, i32 addrspace(1)* %24, align 4, !tbaa !4
  %25 = or i32 %16, 3
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %26
  store i32 %2, i32 addrspace(1)* %27, align 4, !tbaa !4
  %28 = or i32 %16, 4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %29
  store i32 %2, i32 addrspace(1)* %30, align 4, !tbaa !4
  %31 = or i32 %16, 5
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %32
  store i32 %2, i32 addrspace(1)* %33, align 4, !tbaa !4
  %34 = or i32 %16, 6
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %35
  store i32 %2, i32 addrspace(1)* %36, align 4, !tbaa !4
  %37 = or i32 %16, 7
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %38
  store i32 %2, i32 addrspace(1)* %39, align 4, !tbaa !4
  %40 = or i32 %16, 8
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %41
  store i32 %2, i32 addrspace(1)* %42, align 4, !tbaa !4
  %43 = or i32 %16, 9
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %44
  store i32 %2, i32 addrspace(1)* %45, align 4, !tbaa !4
  %46 = or i32 %16, 10
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %47
  store i32 %2, i32 addrspace(1)* %48, align 4, !tbaa !4
  %49 = or i32 %16, 11
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %50
  store i32 %2, i32 addrspace(1)* %51, align 4, !tbaa !4
  %52 = or i32 %16, 12
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %53
  store i32 %2, i32 addrspace(1)* %54, align 4, !tbaa !4
  %55 = or i32 %16, 13
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %56
  store i32 %2, i32 addrspace(1)* %57, align 4, !tbaa !4
  %58 = or i32 %16, 14
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %59
  store i32 %2, i32 addrspace(1)* %60, align 4, !tbaa !4
  %61 = or i32 %16, 15
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %62
  store i32 %2, i32 addrspace(1)* %63, align 4, !tbaa !4
  %64 = or i32 %16, 16
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %65
  store i32 %2, i32 addrspace(1)* %66, align 4, !tbaa !4
  %67 = or i32 %16, 17
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %68
  store i32 %2, i32 addrspace(1)* %69, align 4, !tbaa !4
  %70 = or i32 %16, 18
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %71
  store i32 %2, i32 addrspace(1)* %72, align 4, !tbaa !4
  %73 = or i32 %16, 19
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %74
  store i32 %2, i32 addrspace(1)* %75, align 4, !tbaa !4
  %76 = or i32 %16, 20
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %77
  store i32 %2, i32 addrspace(1)* %78, align 4, !tbaa !4
  %79 = or i32 %16, 21
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %80
  store i32 %2, i32 addrspace(1)* %81, align 4, !tbaa !4
  %82 = or i32 %16, 22
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %83
  store i32 %2, i32 addrspace(1)* %84, align 4, !tbaa !4
  %85 = or i32 %16, 23
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %86
  store i32 %2, i32 addrspace(1)* %87, align 4, !tbaa !4
  %88 = or i32 %16, 24
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %89
  store i32 %2, i32 addrspace(1)* %90, align 4, !tbaa !4
  %91 = or i32 %16, 25
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %92
  store i32 %2, i32 addrspace(1)* %93, align 4, !tbaa !4
  %94 = or i32 %16, 26
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %95
  store i32 %2, i32 addrspace(1)* %96, align 4, !tbaa !4
  %97 = or i32 %16, 27
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %98
  store i32 %2, i32 addrspace(1)* %99, align 4, !tbaa !4
  %100 = or i32 %16, 28
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %101
  store i32 %2, i32 addrspace(1)* %102, align 4, !tbaa !4
  %103 = or i32 %16, 29
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %104
  store i32 %2, i32 addrspace(1)* %105, align 4, !tbaa !4
  %106 = or i32 %16, 30
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %107
  store i32 %2, i32 addrspace(1)* %108, align 4, !tbaa !4
  %109 = or i32 %16, 31
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %110
  store i32 %2, i32 addrspace(1)* %111, align 4, !tbaa !4
  %112 = add nuw nsw i32 %16, 32
  %113 = icmp eq i32 %112, 262144
  br i1 %113, label %114, label %15, !llvm.loop !8

114:                                              ; preds = %15, %8
  ret void
}

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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
