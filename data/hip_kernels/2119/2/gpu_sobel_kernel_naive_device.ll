; ModuleID = '../data/hip_kernels/2119/2/main.cu'
source_filename = "../data/hip_kernels/2119/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22gpu_sobel_kernel_naivePhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = mul i32 %21, %2
  %23 = icmp eq i32 %21, 0
  br i1 %23, label %93, label %24

24:                                               ; preds = %4
  %25 = add i32 %3, -1
  %26 = icmp ult i32 %21, %25
  %27 = icmp ne i32 %13, 0
  %28 = select i1 %26, i1 %27, i1 false
  %29 = add i32 %2, -1
  %30 = icmp ult i32 %13, %29
  %31 = select i1 %28, i1 %30, i1 false
  br i1 %31, label %32, label %93

32:                                               ; preds = %24
  %33 = add nsw i32 %21, -1
  %34 = mul i32 %33, %2
  %35 = add nsw i32 %13, -1
  %36 = add i32 %34, %35
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7, !amdgpu.noclobber !5
  %40 = zext i8 %39 to i32
  %41 = add i32 %34, %13
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7, !amdgpu.noclobber !5
  %45 = zext i8 %44 to i32
  %46 = add nuw nsw i32 %13, 1
  %47 = add i32 %34, %46
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !7, !amdgpu.noclobber !5
  %51 = zext i8 %50 to i32
  %52 = add nuw nsw i32 %21, 1
  %53 = mul i32 %52, %2
  %54 = add i32 %53, %35
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7, !amdgpu.noclobber !5
  %58 = zext i8 %57 to i32
  %59 = add i32 %53, %13
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !7, !amdgpu.noclobber !5
  %63 = zext i8 %62 to i32
  %64 = add i32 %53, %46
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !7, !amdgpu.noclobber !5
  %68 = zext i8 %67 to i32
  %69 = add nuw nsw i32 %45, %40
  %70 = add nuw nsw i32 %69, %51
  %71 = add nuw nsw i32 %58, %63
  %72 = add nuw nsw i32 %71, %68
  %73 = sub nsw i32 %70, %72
  %74 = tail call i32 @llvm.abs.i32(i32 %73, i1 true)
  %75 = add i32 %22, %35
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %76
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !7, !amdgpu.noclobber !5
  %79 = zext i8 %78 to i32
  %80 = add i32 %22, %46
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %81
  %83 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !7, !amdgpu.noclobber !5
  %84 = zext i8 %83 to i32
  %85 = add nuw nsw i32 %40, %58
  %86 = add nuw nsw i32 %51, %68
  %87 = add nuw nsw i32 %85, %79
  %88 = add nuw nsw i32 %86, %84
  %89 = sub nsw i32 %87, %88
  %90 = tail call i32 @llvm.abs.i32(i32 %89, i1 true)
  %91 = add nuw nsw i32 %90, %74
  %92 = trunc i32 %91 to i8
  br label %93

93:                                               ; preds = %4, %24, %32
  %94 = phi i8 [ %92, %32 ], [ 0, %24 ], [ 0, %4 ]
  %95 = add i32 %22, %13
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %96
  store i8 %94, i8 addrspace(1)* %97, align 1, !tbaa !7
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
