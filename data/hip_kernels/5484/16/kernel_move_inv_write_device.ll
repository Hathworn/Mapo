; ModuleID = '../data/hip_kernels/5484/16/main.cu'
source_filename = "../data/hip_kernels/5484/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z21kernel_move_inv_writePcS_j(i8 addrspace(1)* writeonly %0, i8 addrspace(1)* readnone %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 20
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %6
  %8 = bitcast i8 addrspace(1)* %7 to i32 addrspace(1)*
  %9 = icmp ult i8 addrspace(1)* %7, %1
  br i1 %9, label %10, label %109

10:                                               ; preds = %3, %10
  %11 = phi i32 [ %107, %10 ], [ 0, %3 ]
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %12
  store i32 %2, i32 addrspace(1)* %13, align 4, !tbaa !4
  %14 = or i32 %11, 1
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %15
  store i32 %2, i32 addrspace(1)* %16, align 4, !tbaa !4
  %17 = or i32 %11, 2
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %18
  store i32 %2, i32 addrspace(1)* %19, align 4, !tbaa !4
  %20 = or i32 %11, 3
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %21
  store i32 %2, i32 addrspace(1)* %22, align 4, !tbaa !4
  %23 = or i32 %11, 4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %24
  store i32 %2, i32 addrspace(1)* %25, align 4, !tbaa !4
  %26 = or i32 %11, 5
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %27
  store i32 %2, i32 addrspace(1)* %28, align 4, !tbaa !4
  %29 = or i32 %11, 6
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %30
  store i32 %2, i32 addrspace(1)* %31, align 4, !tbaa !4
  %32 = or i32 %11, 7
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %33
  store i32 %2, i32 addrspace(1)* %34, align 4, !tbaa !4
  %35 = or i32 %11, 8
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %36
  store i32 %2, i32 addrspace(1)* %37, align 4, !tbaa !4
  %38 = or i32 %11, 9
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %39
  store i32 %2, i32 addrspace(1)* %40, align 4, !tbaa !4
  %41 = or i32 %11, 10
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %42
  store i32 %2, i32 addrspace(1)* %43, align 4, !tbaa !4
  %44 = or i32 %11, 11
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %45
  store i32 %2, i32 addrspace(1)* %46, align 4, !tbaa !4
  %47 = or i32 %11, 12
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %48
  store i32 %2, i32 addrspace(1)* %49, align 4, !tbaa !4
  %50 = or i32 %11, 13
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %51
  store i32 %2, i32 addrspace(1)* %52, align 4, !tbaa !4
  %53 = or i32 %11, 14
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %54
  store i32 %2, i32 addrspace(1)* %55, align 4, !tbaa !4
  %56 = or i32 %11, 15
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %57
  store i32 %2, i32 addrspace(1)* %58, align 4, !tbaa !4
  %59 = or i32 %11, 16
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %60
  store i32 %2, i32 addrspace(1)* %61, align 4, !tbaa !4
  %62 = or i32 %11, 17
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %63
  store i32 %2, i32 addrspace(1)* %64, align 4, !tbaa !4
  %65 = or i32 %11, 18
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %66
  store i32 %2, i32 addrspace(1)* %67, align 4, !tbaa !4
  %68 = or i32 %11, 19
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %69
  store i32 %2, i32 addrspace(1)* %70, align 4, !tbaa !4
  %71 = or i32 %11, 20
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %72
  store i32 %2, i32 addrspace(1)* %73, align 4, !tbaa !4
  %74 = or i32 %11, 21
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %75
  store i32 %2, i32 addrspace(1)* %76, align 4, !tbaa !4
  %77 = or i32 %11, 22
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %78
  store i32 %2, i32 addrspace(1)* %79, align 4, !tbaa !4
  %80 = or i32 %11, 23
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %81
  store i32 %2, i32 addrspace(1)* %82, align 4, !tbaa !4
  %83 = or i32 %11, 24
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %84
  store i32 %2, i32 addrspace(1)* %85, align 4, !tbaa !4
  %86 = or i32 %11, 25
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %87
  store i32 %2, i32 addrspace(1)* %88, align 4, !tbaa !4
  %89 = or i32 %11, 26
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %90
  store i32 %2, i32 addrspace(1)* %91, align 4, !tbaa !4
  %92 = or i32 %11, 27
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %93
  store i32 %2, i32 addrspace(1)* %94, align 4, !tbaa !4
  %95 = or i32 %11, 28
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %96
  store i32 %2, i32 addrspace(1)* %97, align 4, !tbaa !4
  %98 = or i32 %11, 29
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %99
  store i32 %2, i32 addrspace(1)* %100, align 4, !tbaa !4
  %101 = or i32 %11, 30
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %102
  store i32 %2, i32 addrspace(1)* %103, align 4, !tbaa !4
  %104 = or i32 %11, 31
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %105
  store i32 %2, i32 addrspace(1)* %106, align 4, !tbaa !4
  %107 = add nuw nsw i32 %11, 32
  %108 = icmp eq i32 %107, 262144
  br i1 %108, label %109, label %10, !llvm.loop !8

109:                                              ; preds = %10, %3
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
