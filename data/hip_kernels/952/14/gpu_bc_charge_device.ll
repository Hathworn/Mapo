; ModuleID = '../data/hip_kernels/952/14/main.cu'
source_filename = "../data/hip_kernels/952/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@perturb = protected addrspace(1) externally_initialized global i32 0, align 4
@charge0 = protected addrspace(4) externally_initialized global double 1.000000e+01, align 8
@w0 = protected addrspace(4) externally_initialized global double 0x3FDC71C71C71C71C, align 8
@ws = protected addrspace(4) externally_initialized global double 0x3FBC71C71C71C71C, align 8
@wd = protected addrspace(4) externally_initialized global double 0x3F9C71C71C71C71C, align 8
@llvm.compiler.used = appending addrspace(1) global [5 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @charge0 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @perturb to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @w0 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @wd to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @ws to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13gpu_bc_chargePdS_S_(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  store i32 0, i32 addrspace(1)* @perturb, align 4, !tbaa !7
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %74

15:                                               ; preds = %3
  %16 = load double, double addrspace(4)* @charge0, align 8, !tbaa !11
  %17 = fmul contract double %16, 2.000000e+00
  %18 = load double, double addrspace(4)* @w0, align 8, !tbaa !11
  %19 = fmul contract double %17, %18
  %20 = load double, double addrspace(4)* @ws, align 8, !tbaa !11
  %21 = fmul contract double %17, %20
  %22 = load double, double addrspace(4)* @wd, align 8, !tbaa !11
  %23 = fmul contract double %17, %22
  %24 = zext i32 %12 to i64
  %25 = getelementptr inbounds double, double addrspace(1)* %2, i64 %24
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !11, !amdgpu.noclobber !5
  %27 = add i32 %12, 12322
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %2, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !11, !amdgpu.noclobber !5
  %31 = add i32 %12, 24644
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %2, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !11, !amdgpu.noclobber !5
  %35 = add i32 %12, 36966
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !11, !amdgpu.noclobber !5
  %39 = add i32 %12, 49288
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %2, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !11, !amdgpu.noclobber !5
  %43 = add i32 %12, 61610
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %2, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !11, !amdgpu.noclobber !5
  %47 = add i32 %12, 73932
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %2, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !11, !amdgpu.noclobber !5
  %51 = add i32 %12, 86254
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %2, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !11, !amdgpu.noclobber !5
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %24
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !11, !amdgpu.noclobber !5
  %57 = fsub contract double %19, %56
  store double %57, double addrspace(1)* %55, align 8, !tbaa !11
  %58 = fsub contract double %21, %26
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %32
  store double %58, double addrspace(1)* %59, align 8, !tbaa !11
  %60 = fsub contract double %21, %30
  %61 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  store double %60, double addrspace(1)* %61, align 8, !tbaa !11
  %62 = fsub contract double %21, %34
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %24
  store double %62, double addrspace(1)* %63, align 8, !tbaa !11
  %64 = fsub contract double %21, %38
  %65 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  store double %64, double addrspace(1)* %65, align 8, !tbaa !11
  %66 = fsub contract double %23, %42
  %67 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  store double %66, double addrspace(1)* %67, align 8, !tbaa !11
  %68 = fsub contract double %23, %46
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %52
  store double %68, double addrspace(1)* %69, align 8, !tbaa !11
  %70 = fsub contract double %23, %50
  %71 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  store double %70, double addrspace(1)* %71, align 8, !tbaa !11
  %72 = fsub contract double %23, %54
  %73 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  store double %72, double addrspace(1)* %73, align 8, !tbaa !11
  br label %74

74:                                               ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
