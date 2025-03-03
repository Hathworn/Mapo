; ModuleID = '../data/hip_kernels/14714/11/main.cu'
source_filename = "../data/hip_kernels/14714/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z17kernel_test5_initPcS_(i8 addrspace(1)* writeonly %0, i8 addrspace(1)* readnone %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = shl i32 %3, 20
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %5
  %7 = bitcast i8 addrspace(1)* %6 to i32 addrspace(1)*
  %8 = icmp ult i8 addrspace(1)* %6, %1
  br i1 %8, label %9, label %115

9:                                                ; preds = %2, %9
  %10 = phi i32 [ %113, %9 ], [ 0, %2 ]
  %11 = phi i32 [ %112, %9 ], [ 1, %2 ]
  %12 = zext i32 %10 to i64
  %13 = xor i32 %11, -1
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %12
  store i32 %11, i32 addrspace(1)* %14, align 4, !tbaa !4
  %15 = or i32 %10, 1
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %16
  store i32 %11, i32 addrspace(1)* %17, align 4, !tbaa !4
  %18 = or i32 %10, 2
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %19
  store i32 %13, i32 addrspace(1)* %20, align 4, !tbaa !4
  %21 = or i32 %10, 3
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %22
  store i32 %13, i32 addrspace(1)* %23, align 4, !tbaa !4
  %24 = or i32 %10, 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %25
  store i32 %11, i32 addrspace(1)* %26, align 4, !tbaa !4
  %27 = or i32 %10, 5
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %28
  store i32 %11, i32 addrspace(1)* %29, align 4, !tbaa !4
  %30 = or i32 %10, 6
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %31
  store i32 %13, i32 addrspace(1)* %32, align 4, !tbaa !4
  %33 = or i32 %10, 7
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %34
  store i32 %13, i32 addrspace(1)* %35, align 4, !tbaa !4
  %36 = or i32 %10, 8
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %37
  store i32 %11, i32 addrspace(1)* %38, align 4, !tbaa !4
  %39 = or i32 %10, 9
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %40
  store i32 %11, i32 addrspace(1)* %41, align 4, !tbaa !4
  %42 = or i32 %10, 10
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %43
  store i32 %13, i32 addrspace(1)* %44, align 4, !tbaa !4
  %45 = or i32 %10, 11
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %46
  store i32 %13, i32 addrspace(1)* %47, align 4, !tbaa !4
  %48 = or i32 %10, 12
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %49
  store i32 %11, i32 addrspace(1)* %50, align 4, !tbaa !4
  %51 = or i32 %10, 13
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %52
  store i32 %11, i32 addrspace(1)* %53, align 4, !tbaa !4
  %54 = or i32 %10, 14
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %55
  store i32 %13, i32 addrspace(1)* %56, align 4, !tbaa !4
  %57 = or i32 %10, 15
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %58
  store i32 %13, i32 addrspace(1)* %59, align 4, !tbaa !4
  %60 = shl i32 %11, 1
  %61 = tail call i32 @llvm.umax.i32(i32 %60, i32 1)
  %62 = or i32 %10, 16
  %63 = zext i32 %62 to i64
  %64 = xor i32 %61, -1
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %63
  store i32 %61, i32 addrspace(1)* %65, align 4, !tbaa !4
  %66 = or i32 %10, 17
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %67
  store i32 %61, i32 addrspace(1)* %68, align 4, !tbaa !4
  %69 = or i32 %10, 18
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %70
  store i32 %64, i32 addrspace(1)* %71, align 4, !tbaa !4
  %72 = or i32 %10, 19
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %73
  store i32 %64, i32 addrspace(1)* %74, align 4, !tbaa !4
  %75 = or i32 %10, 20
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %76
  store i32 %61, i32 addrspace(1)* %77, align 4, !tbaa !4
  %78 = or i32 %10, 21
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %79
  store i32 %61, i32 addrspace(1)* %80, align 4, !tbaa !4
  %81 = or i32 %10, 22
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %82
  store i32 %64, i32 addrspace(1)* %83, align 4, !tbaa !4
  %84 = or i32 %10, 23
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %85
  store i32 %64, i32 addrspace(1)* %86, align 4, !tbaa !4
  %87 = or i32 %10, 24
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %88
  store i32 %61, i32 addrspace(1)* %89, align 4, !tbaa !4
  %90 = or i32 %10, 25
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %91
  store i32 %61, i32 addrspace(1)* %92, align 4, !tbaa !4
  %93 = or i32 %10, 26
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %94
  store i32 %64, i32 addrspace(1)* %95, align 4, !tbaa !4
  %96 = or i32 %10, 27
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %97
  store i32 %64, i32 addrspace(1)* %98, align 4, !tbaa !4
  %99 = or i32 %10, 28
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %100
  store i32 %61, i32 addrspace(1)* %101, align 4, !tbaa !4
  %102 = or i32 %10, 29
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %103
  store i32 %61, i32 addrspace(1)* %104, align 4, !tbaa !4
  %105 = or i32 %10, 30
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %106
  store i32 %64, i32 addrspace(1)* %107, align 4, !tbaa !4
  %108 = or i32 %10, 31
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %109
  store i32 %64, i32 addrspace(1)* %110, align 4, !tbaa !4
  %111 = shl i32 %61, 1
  %112 = tail call i32 @llvm.umax.i32(i32 %111, i32 1)
  %113 = add nuw nsw i32 %10, 32
  %114 = icmp ult i32 %62, 262128
  br i1 %114, label %9, label %115, !llvm.loop !8

115:                                              ; preds = %9, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
