; ModuleID = '../data/hip_kernels/14636/1/main.cu'
source_filename = "../data/hip_kernels/14636/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6smoothPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %3, %2
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %146

16:                                               ; preds = %4
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %17
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !7, !amdgpu.noclobber !5
  %20 = add nsw i32 %3, 4
  %21 = add nsw i32 %13, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %22
  %24 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !7, !amdgpu.noclobber !5
  %25 = add i8 %24, %19
  %26 = shl nsw i32 %20, 1
  %27 = add nsw i32 %13, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7, !amdgpu.noclobber !5
  %31 = add i8 %25, %30
  %32 = mul nsw i32 %20, 3
  %33 = add nsw i32 %13, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7, !amdgpu.noclobber !5
  %37 = add i8 %31, %36
  %38 = shl nsw i32 %20, 2
  %39 = add nsw i32 %13, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = add i8 %37, %42
  %44 = add nsw i32 %13, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %45
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !7, !amdgpu.noclobber !5
  %48 = add i8 %43, %47
  %49 = add nsw i32 %21, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = add i8 %48, %52
  %54 = add nsw i32 %27, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7, !amdgpu.noclobber !5
  %58 = add i8 %53, %57
  %59 = add nsw i32 %33, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !7, !amdgpu.noclobber !5
  %63 = add i8 %58, %62
  %64 = add nsw i32 %39, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !7, !amdgpu.noclobber !5
  %68 = add i8 %63, %67
  %69 = add nsw i32 %13, 2
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7, !amdgpu.noclobber !5
  %73 = add i8 %68, %72
  %74 = add nsw i32 %21, 2
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %75
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7, !amdgpu.noclobber !5
  %78 = add i8 %73, %77
  %79 = add nsw i32 %27, 2
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !5
  %83 = add i8 %78, %82
  %84 = add nsw i32 %33, 2
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %85
  %87 = load i8, i8 addrspace(1)* %86, align 1, !tbaa !7, !amdgpu.noclobber !5
  %88 = add i8 %83, %87
  %89 = add nsw i32 %39, 2
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7, !amdgpu.noclobber !5
  %93 = add i8 %88, %92
  %94 = add nsw i32 %13, 3
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7, !amdgpu.noclobber !5
  %98 = add i8 %93, %97
  %99 = add nsw i32 %21, 3
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %100
  %102 = load i8, i8 addrspace(1)* %101, align 1, !tbaa !7, !amdgpu.noclobber !5
  %103 = add i8 %98, %102
  %104 = add nsw i32 %27, 3
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %105
  %107 = load i8, i8 addrspace(1)* %106, align 1, !tbaa !7, !amdgpu.noclobber !5
  %108 = add i8 %103, %107
  %109 = add nsw i32 %33, 3
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %110
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !7, !amdgpu.noclobber !5
  %113 = add i8 %108, %112
  %114 = add nsw i32 %39, 3
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %115
  %117 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !7, !amdgpu.noclobber !5
  %118 = add i8 %113, %117
  %119 = add nsw i32 %13, 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %120
  %122 = load i8, i8 addrspace(1)* %121, align 1, !tbaa !7, !amdgpu.noclobber !5
  %123 = add i8 %118, %122
  %124 = add nsw i32 %21, 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %125
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !7, !amdgpu.noclobber !5
  %128 = add i8 %123, %127
  %129 = add nsw i32 %27, 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %130
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !7, !amdgpu.noclobber !5
  %133 = add i8 %128, %132
  %134 = add nsw i32 %33, 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %135
  %137 = load i8, i8 addrspace(1)* %136, align 1, !tbaa !7, !amdgpu.noclobber !5
  %138 = add i8 %133, %137
  %139 = add nsw i32 %39, 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %140
  %142 = load i8, i8 addrspace(1)* %141, align 1, !tbaa !7, !amdgpu.noclobber !5
  %143 = add i8 %138, %142
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %17
  %145 = udiv i8 %143, 25
  store i8 %145, i8 addrspace(1)* %144, align 1, !tbaa !7
  br label %146

146:                                              ; preds = %16, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
