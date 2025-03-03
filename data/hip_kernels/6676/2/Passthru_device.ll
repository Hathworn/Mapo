; ModuleID = '../data/hip_kernels/6676/2/main.cu'
source_filename = "../data/hip_kernels/6676/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@constAlpha = protected addrspace(4) externally_initialized global i32 0, align 4
@constHueColorSpaceMat = protected local_unnamed_addr addrspace(4) externally_initialized global [9 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @constAlpha to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8PassthruPjmS_mjj(i32 addrspace(1)* nocapture readonly %0, i64 %1, i32 addrspace(1)* nocapture writeonly %2, i64 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = bitcast i32 addrspace(1)* %0 to i8 addrspace(1)*
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = shl nuw nsw i16 %12, 1
  %14 = zext i16 %13 to i32
  %15 = mul i32 %8, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = shl nuw nsw i32 %16, 1
  %18 = add i32 %15, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp ult i32 %18, %4
  %28 = icmp ult i32 %26, %5
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %71

30:                                               ; preds = %6
  %31 = trunc i64 %1 to i32
  %32 = lshr i64 %3, 2
  %33 = trunc i64 %32 to i32
  %34 = mul i32 %26, %31
  %35 = add i32 %34, %18
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !5
  %39 = add i32 %35, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = uitofp i8 %38 to float
  %44 = uitofp i8 %42 to float
  %45 = load i32, i32 addrspace(4)* @constAlpha, align 4, !tbaa !10
  %46 = tail call float @llvm.maxnum.f32(float %43, float 0.000000e+00)
  %47 = tail call float @llvm.minnum.f32(float %46, float 2.550000e+02)
  %48 = fptoui float %47 to i32
  %49 = shl i32 %48, 24
  %50 = shl i32 %48, 16
  %51 = shl i32 %48, 8
  %52 = or i32 %50, %49
  %53 = or i32 %52, %51
  %54 = or i32 %53, %45
  %55 = mul i32 %26, %33
  %56 = add i32 %55, %18
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %57
  store i32 %54, i32 addrspace(1)* %58, align 4, !tbaa !10
  %59 = tail call float @llvm.maxnum.f32(float %44, float 0.000000e+00)
  %60 = tail call float @llvm.minnum.f32(float %59, float 2.550000e+02)
  %61 = fptoui float %60 to i32
  %62 = shl i32 %61, 24
  %63 = shl i32 %61, 16
  %64 = shl i32 %61, 8
  %65 = or i32 %63, %62
  %66 = or i32 %65, %64
  %67 = or i32 %66, %45
  %68 = add i32 %56, 1
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %69
  store i32 %67, i32 addrspace(1)* %70, align 4, !tbaa !10
  br label %71

71:                                               ; preds = %6, %30
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
