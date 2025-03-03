; ModuleID = '../data/hip_kernels/2824/251/main.cu'
source_filename = "../data/hip_kernels/2824/251/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19transposeSmemUnrollPfS_iiE4tile = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z19transposeSmemUnrollPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 1
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul i32 %22, %2
  %24 = add i32 %23, %14
  %25 = mul nuw nsw i32 %21, %11
  %26 = add nuw nsw i32 %25, %13
  %27 = freeze i32 %26
  %28 = freeze i32 %19
  %29 = udiv i32 %27, %28
  %30 = mul i32 %29, %28
  %31 = sub i32 %27, %30
  %32 = add i32 %20, %31
  %33 = add i32 %12, %29
  %34 = mul i32 %33, %3
  %35 = add i32 %32, %34
  %36 = add i32 %14, %11
  %37 = icmp ult i32 %36, %2
  %38 = icmp ult i32 %22, %3
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %40, label %68

40:                                               ; preds = %4
  %41 = shl nuw nsw i32 %21, 1
  %42 = mul nuw nsw i32 %41, %11
  %43 = add nuw nsw i32 %42, %13
  %44 = zext i32 %24 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ19transposeSmemUnrollPfS_iiE4tile, i32 0, i32 %43
  store float %46, float addrspace(3)* %47, align 4, !tbaa !7
  %48 = add i32 %24, 16
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = add nuw nsw i32 %43, 16
  %53 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ19transposeSmemUnrollPfS_iiE4tile, i32 0, i32 %52
  store float %51, float addrspace(3)* %53, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = shl nuw nsw i32 %11, 1
  %55 = mul nuw nsw i32 %54, %31
  %56 = add nuw nsw i32 %55, %29
  %57 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ19transposeSmemUnrollPfS_iiE4tile, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %59 = zext i32 %35 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  store float %58, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = add nuw nsw i32 %56, 16
  %62 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ19transposeSmemUnrollPfS_iiE4tile, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %64 = shl nsw i32 %3, 4
  %65 = add i32 %35, %64
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  store float %63, float addrspace(1)* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %40, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
