; ModuleID = '../data/hip_kernels/15618/1/main.cu'
source_filename = "../data/hip_kernels/15618/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20computeScaledHeatmapPimS_m(i32 addrspace(1)* nocapture readonly %0, i64 %1, i32 addrspace(1)* nocapture writeonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %6, %13
  %15 = add i32 %14, %8
  %16 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %5, %19
  %21 = add i32 %20, %7
  %22 = bitcast i32 addrspace(1)* %0 to i8 addrspace(1)*
  %23 = sext i32 %21 to i64
  %24 = mul i64 %23, %1
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %22, i64 %24
  %26 = bitcast i8 addrspace(1)* %25 to i32 addrspace(1)*
  %27 = sext i32 %15 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %26, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = bitcast i32 addrspace(1)* %2 to i8 addrspace(1)*
  %31 = mul nsw i32 %21, 5
  %32 = mul nsw i32 %15, 5
  %33 = sext i32 %32 to i64
  %34 = sext i32 %31 to i64
  %35 = mul i64 %34, %3
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %35
  %37 = bitcast i8 addrspace(1)* %36 to i32 addrspace(1)*
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %33
  store i32 %29, i32 addrspace(1)* %38, align 4, !tbaa !7
  %39 = add nsw i32 %32, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %40
  store i32 %29, i32 addrspace(1)* %41, align 4, !tbaa !7
  %42 = add nsw i32 %32, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %43
  store i32 %29, i32 addrspace(1)* %44, align 4, !tbaa !7
  %45 = add nsw i32 %32, 3
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %46
  store i32 %29, i32 addrspace(1)* %47, align 4, !tbaa !7
  %48 = add nsw i32 %32, 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %49
  store i32 %29, i32 addrspace(1)* %50, align 4, !tbaa !7
  %51 = add nsw i32 %31, 1
  %52 = sext i32 %51 to i64
  %53 = mul i64 %52, %3
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %53
  %55 = bitcast i8 addrspace(1)* %54 to i32 addrspace(1)*
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %55, i64 %33
  store i32 %29, i32 addrspace(1)* %56, align 4, !tbaa !7
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %55, i64 %40
  store i32 %29, i32 addrspace(1)* %57, align 4, !tbaa !7
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %55, i64 %43
  store i32 %29, i32 addrspace(1)* %58, align 4, !tbaa !7
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %55, i64 %46
  store i32 %29, i32 addrspace(1)* %59, align 4, !tbaa !7
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %55, i64 %49
  store i32 %29, i32 addrspace(1)* %60, align 4, !tbaa !7
  %61 = add nsw i32 %31, 2
  %62 = sext i32 %61 to i64
  %63 = mul i64 %62, %3
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %63
  %65 = bitcast i8 addrspace(1)* %64 to i32 addrspace(1)*
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %33
  store i32 %29, i32 addrspace(1)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %40
  store i32 %29, i32 addrspace(1)* %67, align 4, !tbaa !7
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %43
  store i32 %29, i32 addrspace(1)* %68, align 4, !tbaa !7
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %46
  store i32 %29, i32 addrspace(1)* %69, align 4, !tbaa !7
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %49
  store i32 %29, i32 addrspace(1)* %70, align 4, !tbaa !7
  %71 = add nsw i32 %31, 3
  %72 = sext i32 %71 to i64
  %73 = mul i64 %72, %3
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %73
  %75 = bitcast i8 addrspace(1)* %74 to i32 addrspace(1)*
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %75, i64 %33
  store i32 %29, i32 addrspace(1)* %76, align 4, !tbaa !7
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %75, i64 %40
  store i32 %29, i32 addrspace(1)* %77, align 4, !tbaa !7
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %75, i64 %43
  store i32 %29, i32 addrspace(1)* %78, align 4, !tbaa !7
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %75, i64 %46
  store i32 %29, i32 addrspace(1)* %79, align 4, !tbaa !7
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %75, i64 %49
  store i32 %29, i32 addrspace(1)* %80, align 4, !tbaa !7
  %81 = add nsw i32 %31, 4
  %82 = sext i32 %81 to i64
  %83 = mul i64 %82, %3
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %83
  %85 = bitcast i8 addrspace(1)* %84 to i32 addrspace(1)*
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %85, i64 %33
  store i32 %29, i32 addrspace(1)* %86, align 4, !tbaa !7
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %85, i64 %40
  store i32 %29, i32 addrspace(1)* %87, align 4, !tbaa !7
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %85, i64 %43
  store i32 %29, i32 addrspace(1)* %88, align 4, !tbaa !7
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %85, i64 %46
  store i32 %29, i32 addrspace(1)* %89, align 4, !tbaa !7
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %85, i64 %49
  store i32 %29, i32 addrspace(1)* %90, align 4, !tbaa !7
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
