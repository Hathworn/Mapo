; ModuleID = '../data/hip_kernels/4154/9/main.cu'
source_filename = "../data/hip_kernels/4154/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL19convertPToRGBKernelPKtPhiiiPi = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL19convertPToRGBKernelPKtPhiiiPi(i16 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 comdat {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = sdiv i32 %2, 2
  %25 = icmp slt i32 %15, %24
  %26 = icmp slt i32 %23, %4
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %129

28:                                               ; preds = %6
  %29 = shl nsw i32 %15, 1
  %30 = mul nsw i32 %23, %2
  %31 = add nsw i32 %30, %29
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %32
  %34 = load i16, i16 addrspace(1)* %33, align 2, !tbaa !7, !amdgpu.noclobber !5
  %35 = zext i16 %34 to i32
  %36 = mul nuw nsw i32 %35, 1000
  %37 = add nsw i32 %31, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %38
  %40 = load i16, i16 addrspace(1)* %39, align 2, !tbaa !7, !amdgpu.noclobber !5
  %41 = zext i16 %40 to i32
  %42 = mul nuw nsw i32 %41, 1000
  %43 = sdiv i32 %30, 2
  %44 = mul nsw i32 %4, %2
  %45 = add i32 %43, %15
  %46 = add i32 %45, %44
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %47
  %49 = load i16, i16 addrspace(1)* %48, align 2, !tbaa !7, !amdgpu.noclobber !5
  %50 = zext i16 %49 to i32
  %51 = mul nsw i32 %44, 3
  %52 = sdiv i32 %51, 2
  %53 = add i32 %45, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %54
  %56 = load i16, i16 addrspace(1)* %55, align 2, !tbaa !7, !amdgpu.noclobber !5
  %57 = zext i16 %56 to i32
  %58 = mul nsw i32 %15, 6
  %59 = mul i32 %3, 3
  %60 = mul i32 %59, %23
  %61 = mul nuw nsw i32 %57, 1407
  %62 = add nsw i32 %61, -720384
  %63 = mul nuw nsw i32 %57, 716
  %64 = mul nuw nsw i32 %50, 345
  %65 = add nsw i32 %64, -543232
  %66 = add nsw i32 %65, %63
  %67 = mul nuw nsw i32 %50, 1779
  %68 = add nsw i32 %67, -910848
  %69 = add nsw i32 %62, %36
  %70 = udiv i32 %69, 1000
  %71 = sub nsw i32 %36, %66
  %72 = udiv i32 %71, 1000
  %73 = add nsw i32 %68, %36
  %74 = udiv i32 %73, 1000
  %75 = add nsw i32 %62, %42
  %76 = udiv i32 %75, 1000
  %77 = sub nsw i32 %42, %66
  %78 = udiv i32 %77, 1000
  %79 = add nsw i32 %68, %42
  %80 = udiv i32 %79, 1000
  %81 = and i32 %70, 65535
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !11, !amdgpu.noclobber !5
  %85 = trunc i32 %84 to i8
  %86 = add nsw i32 %60, %58
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %87
  store i8 %85, i8 addrspace(1)* %88, align 1, !tbaa !13
  %89 = and i32 %72, 65535
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !11
  %93 = trunc i32 %92 to i8
  %94 = add nsw i32 %86, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %95
  store i8 %93, i8 addrspace(1)* %96, align 1, !tbaa !13
  %97 = and i32 %74, 65535
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !11
  %101 = trunc i32 %100 to i8
  %102 = add nsw i32 %86, 2
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %103
  store i8 %101, i8 addrspace(1)* %104, align 1, !tbaa !13
  %105 = and i32 %76, 65535
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !11
  %109 = trunc i32 %108 to i8
  %110 = add nsw i32 %86, 3
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %111
  store i8 %109, i8 addrspace(1)* %112, align 1, !tbaa !13
  %113 = and i32 %78, 65535
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !11
  %117 = trunc i32 %116 to i8
  %118 = add nsw i32 %86, 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %119
  store i8 %117, i8 addrspace(1)* %120, align 1, !tbaa !13
  %121 = and i32 %80, 65535
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !11
  %125 = trunc i32 %124 to i8
  %126 = add nsw i32 %86, 5
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %127
  store i8 %125, i8 addrspace(1)* %128, align 1, !tbaa !13
  br label %129

129:                                              ; preds = %28, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!9, !9, i64 0}
