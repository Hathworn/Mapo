; ModuleID = '../data/hip_kernels/2824/89/main.cu'
source_filename = "../data/hip_kernels/2824/89/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7kmeans4PsS_PiS0_i(i16 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = shl i32 %14, 2
  %16 = icmp slt i32 %15, %4
  br i1 %16, label %17, label %134

17:                                               ; preds = %5
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %18
  %20 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 4
  %21 = load i16, i16 addrspace(1)* %20, align 2, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i16 %21 to i32
  %23 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 5
  %24 = load i16, i16 addrspace(1)* %23, align 2, !tbaa !7, !amdgpu.noclobber !5
  %25 = sext i16 %24 to i32
  %26 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 6
  %27 = load i16, i16 addrspace(1)* %26, align 2, !tbaa !7, !amdgpu.noclobber !5
  %28 = sext i16 %27 to i32
  %29 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 7
  %30 = load i16, i16 addrspace(1)* %29, align 2, !tbaa !7, !amdgpu.noclobber !5
  %31 = sext i16 %30 to i32
  %32 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 8
  %33 = load i16, i16 addrspace(1)* %32, align 2, !tbaa !7, !amdgpu.noclobber !5
  %34 = sext i16 %33 to i32
  %35 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 9
  %36 = load i16, i16 addrspace(1)* %35, align 2, !tbaa !7, !amdgpu.noclobber !5
  %37 = sext i16 %36 to i32
  %38 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 10
  %39 = load i16, i16 addrspace(1)* %38, align 2, !tbaa !7, !amdgpu.noclobber !5
  %40 = sext i16 %39 to i32
  %41 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 11
  %42 = load i16, i16 addrspace(1)* %41, align 2, !tbaa !7, !amdgpu.noclobber !5
  %43 = sext i16 %42 to i32
  %44 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 12
  %45 = load i16, i16 addrspace(1)* %44, align 2, !tbaa !7, !amdgpu.noclobber !5
  %46 = sext i16 %45 to i32
  %47 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 13
  %48 = load i16, i16 addrspace(1)* %47, align 2, !tbaa !7, !amdgpu.noclobber !5
  %49 = sext i16 %48 to i32
  %50 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 14
  %51 = load i16, i16 addrspace(1)* %50, align 2, !tbaa !7, !amdgpu.noclobber !5
  %52 = sext i16 %51 to i32
  %53 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 15
  %54 = load i16, i16 addrspace(1)* %53, align 2, !tbaa !7, !amdgpu.noclobber !5
  %55 = sext i16 %54 to i32
  %56 = bitcast i16 addrspace(1)* %19 to <4 x i16> addrspace(1)*
  %57 = load <4 x i16>, <4 x i16> addrspace(1)* %56, align 2, !tbaa !7
  %58 = sext <4 x i16> %57 to <4 x i32>
  %59 = bitcast i16 addrspace(1)* %1 to <4 x i16> addrspace(1)*
  %60 = load <4 x i16>, <4 x i16> addrspace(1)* %59, align 2, !tbaa !7
  %61 = sext <4 x i16> %60 to <4 x i32>
  %62 = sub nsw <4 x i32> %58, %61
  %63 = extractelement <4 x i32> %58, i64 0
  %64 = sub nsw i32 %63, %22
  %65 = extractelement <4 x i32> %58, i64 1
  %66 = sub nsw i32 %65, %25
  %67 = extractelement <4 x i32> %58, i64 2
  %68 = sub nsw i32 %67, %28
  %69 = extractelement <4 x i32> %58, i64 3
  %70 = sub nsw i32 %69, %31
  %71 = sub nsw i32 %63, %34
  %72 = sub nsw i32 %65, %37
  %73 = sub nsw i32 %67, %40
  %74 = sub nsw i32 %69, %43
  %75 = sub nsw i32 %63, %46
  %76 = sub nsw i32 %65, %49
  %77 = sub nsw i32 %67, %52
  %78 = sub nsw i32 %69, %55
  %79 = mul nsw <4 x i32> %62, %62
  %80 = mul nsw i32 %64, %64
  %81 = mul nsw i32 %66, %66
  %82 = mul nsw i32 %68, %68
  %83 = mul nsw i32 %70, %70
  %84 = mul nsw i32 %71, %71
  %85 = mul nsw i32 %72, %72
  %86 = mul nsw i32 %73, %73
  %87 = mul nsw i32 %74, %74
  %88 = mul nsw i32 %75, %75
  %89 = mul nsw i32 %76, %76
  %90 = mul nsw i32 %77, %77
  %91 = mul nsw i32 %78, %78
  %92 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %79)
  %93 = add nuw nsw i32 %81, %80
  %94 = add nuw nsw i32 %93, %82
  %95 = add nuw nsw i32 %94, %83
  %96 = add nuw nsw i32 %85, %84
  %97 = add nuw nsw i32 %96, %86
  %98 = add nuw nsw i32 %97, %87
  %99 = add nuw nsw i32 %89, %88
  %100 = add nuw nsw i32 %99, %90
  %101 = add nuw nsw i32 %100, %91
  %102 = icmp uge i32 %92, %95
  %103 = zext i1 %102 to i32
  %104 = tail call i32 @llvm.umin.i32(i32 %92, i32 %95)
  %105 = icmp ult i32 %98, %101
  %106 = select i1 %105, i32 2, i32 3
  %107 = tail call i32 @llvm.umin.i32(i32 %98, i32 %101)
  %108 = icmp ult i32 %104, %107
  %109 = select i1 %108, i32 %103, i32 %106
  %110 = shl nuw nsw i32 %109, 2
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !11, !amdgpu.noclobber !5
  %114 = add nsw i32 %113, %63
  store i32 %114, i32 addrspace(1)* %112, align 4, !tbaa !11
  %115 = add nuw nsw i32 %110, 1
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !11, !amdgpu.noclobber !5
  %119 = add nsw i32 %118, %65
  store i32 %119, i32 addrspace(1)* %117, align 4, !tbaa !11
  %120 = add nuw nsw i32 %110, 2
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !11, !amdgpu.noclobber !5
  %124 = add nsw i32 %123, %67
  store i32 %124, i32 addrspace(1)* %122, align 4, !tbaa !11
  %125 = add nuw nsw i32 %110, 3
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !11, !amdgpu.noclobber !5
  %129 = add nsw i32 %128, %69
  store i32 %129, i32 addrspace(1)* %127, align 4, !tbaa !11
  %130 = zext i32 %109 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !11
  %133 = add nsw i32 %132, 1
  store i32 %133, i32 addrspace(1)* %131, align 4, !tbaa !11
  br label %134

134:                                              ; preds = %17, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone willreturn }

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
