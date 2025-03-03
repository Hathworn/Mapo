; ModuleID = '../data/hip_kernels/1227/6/main.cu'
source_filename = "../data/hip_kernels/1227/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28mat_transpose_regular_kernelPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = and i32 %3, -32
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = lshr i32 %5, 5
  %7 = and i32 %5, 31
  %8 = or i32 %4, %6
  %9 = shl i32 %3, 5
  %10 = and i32 %9, 992
  %11 = or i32 %10, %7
  %12 = shl nuw nsw i32 %11, 10
  %13 = shl nsw i32 %8, 10
  %14 = or i32 %13, %11
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5
  %18 = add nsw i32 %8, %12
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  store i32 %17, i32 addrspace(1)* %20, align 4, !tbaa !5
  %21 = add nsw i32 %8, 64
  %22 = shl nsw i32 %21, 10
  %23 = or i32 %22, %11
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5
  %27 = add nsw i32 %21, %12
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  store i32 %26, i32 addrspace(1)* %29, align 4, !tbaa !5
  %30 = add nsw i32 %8, 128
  %31 = shl nsw i32 %30, 10
  %32 = or i32 %31, %11
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !5
  %36 = add nsw i32 %30, %12
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  store i32 %35, i32 addrspace(1)* %38, align 4, !tbaa !5
  %39 = add nsw i32 %8, 192
  %40 = shl nsw i32 %39, 10
  %41 = or i32 %40, %11
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5
  %45 = add nsw i32 %39, %12
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  store i32 %44, i32 addrspace(1)* %47, align 4, !tbaa !5
  %48 = add nsw i32 %8, 256
  %49 = shl nsw i32 %48, 10
  %50 = or i32 %49, %11
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !5
  %54 = add nsw i32 %48, %12
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  store i32 %53, i32 addrspace(1)* %56, align 4, !tbaa !5
  %57 = add nsw i32 %8, 320
  %58 = shl nsw i32 %57, 10
  %59 = or i32 %58, %11
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  %63 = add nsw i32 %57, %12
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %64
  store i32 %62, i32 addrspace(1)* %65, align 4, !tbaa !5
  %66 = add nsw i32 %8, 384
  %67 = shl nsw i32 %66, 10
  %68 = or i32 %67, %11
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !5
  %72 = add nsw i32 %66, %12
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  store i32 %71, i32 addrspace(1)* %74, align 4, !tbaa !5
  %75 = add nsw i32 %8, 448
  %76 = shl nsw i32 %75, 10
  %77 = or i32 %76, %11
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !5
  %81 = add nsw i32 %75, %12
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  store i32 %80, i32 addrspace(1)* %83, align 4, !tbaa !5
  %84 = add nsw i32 %8, 512
  %85 = shl nsw i32 %84, 10
  %86 = or i32 %85, %11
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !5
  %90 = add nsw i32 %84, %12
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  store i32 %89, i32 addrspace(1)* %92, align 4, !tbaa !5
  %93 = add nsw i32 %8, 576
  %94 = shl nsw i32 %93, 10
  %95 = or i32 %94, %11
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !5
  %99 = add nsw i32 %93, %12
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %100
  store i32 %98, i32 addrspace(1)* %101, align 4, !tbaa !5
  %102 = add nsw i32 %8, 640
  %103 = shl nsw i32 %102, 10
  %104 = or i32 %103, %11
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !5
  %108 = add nsw i32 %102, %12
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  store i32 %107, i32 addrspace(1)* %110, align 4, !tbaa !5
  %111 = add nsw i32 %8, 704
  %112 = shl nsw i32 %111, 10
  %113 = or i32 %112, %11
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !5
  %117 = add nsw i32 %111, %12
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %118
  store i32 %116, i32 addrspace(1)* %119, align 4, !tbaa !5
  %120 = add nsw i32 %8, 768
  %121 = shl nsw i32 %120, 10
  %122 = or i32 %121, %11
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !5
  %126 = add nsw i32 %120, %12
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %127
  store i32 %125, i32 addrspace(1)* %128, align 4, !tbaa !5
  %129 = add nsw i32 %8, 832
  %130 = shl nsw i32 %129, 10
  %131 = or i32 %130, %11
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %132
  %134 = load i32, i32 addrspace(1)* %133, align 4, !tbaa !5
  %135 = add nsw i32 %129, %12
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %136
  store i32 %134, i32 addrspace(1)* %137, align 4, !tbaa !5
  %138 = add nsw i32 %8, 896
  %139 = shl nsw i32 %138, 10
  %140 = or i32 %139, %11
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !5
  %144 = add nsw i32 %138, %12
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %145
  store i32 %143, i32 addrspace(1)* %146, align 4, !tbaa !5
  %147 = add nsw i32 %8, 960
  %148 = shl nsw i32 %147, 10
  %149 = or i32 %148, %11
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %150
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !5
  %153 = add nsw i32 %147, %12
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %154
  store i32 %152, i32 addrspace(1)* %155, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
