; ModuleID = '../data/hip_kernels/16802/1/main.cu'
source_filename = "../data/hip_kernels/16802/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@dx = protected addrspace(4) externally_initialized global double 1.000000e-02, align 8
@dy = protected addrspace(4) externally_initialized global double 1.000000e-02, align 8
@dz = protected addrspace(4) externally_initialized global double 1.000000e-02, align 8
@llvm.compiler.used = appending addrspace(1) global [3 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @dx to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @dy to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @dz to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10gpu_efieldPdS_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = add i32 %15, 1
  %17 = urem i32 %16, 200
  %18 = add i32 %5, 1
  %19 = and i32 %18, 7
  %20 = add i32 %6, 1
  %21 = urem i32 %20, 101
  %22 = add i32 %15, 199
  %23 = urem i32 %22, 200
  %24 = add i32 %5, 7
  %25 = and i32 %24, 7
  %26 = add i32 %6, 100
  %27 = urem i32 %26, 101
  %28 = shl i32 %6, 3
  %29 = add i32 %28, %5
  %30 = mul i32 %29, 200
  %31 = add i32 %23, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7, !amdgpu.noclobber !5
  %35 = add i32 %17, %30
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !5
  %39 = fsub contract double %34, %38
  %40 = fmul contract double %39, 5.000000e-01
  %41 = load double, double addrspace(4)* @dx, align 8, !tbaa !7
  %42 = fdiv contract double %40, %41
  %43 = add i32 %15, %30
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  store double %42, double addrspace(1)* %45, align 8, !tbaa !7
  %46 = or i32 %25, %28
  %47 = mul i32 %46, 200
  %48 = add i32 %15, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %52 = or i32 %19, %28
  %53 = mul i32 %52, 200
  %54 = add i32 %15, %53
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %0, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7
  %58 = fsub contract double %51, %57
  %59 = fmul contract double %58, 5.000000e-01
  %60 = load double, double addrspace(4)* @dy, align 8, !tbaa !7
  %61 = fdiv contract double %59, %60
  %62 = getelementptr inbounds double, double addrspace(1)* %2, i64 %44
  store double %61, double addrspace(1)* %62, align 8, !tbaa !7
  %63 = shl nuw nsw i32 %27, 3
  %64 = add i32 %63, %5
  %65 = mul i32 %64, 200
  %66 = add i32 %15, %65
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  %70 = shl nuw nsw i32 %21, 3
  %71 = add i32 %70, %5
  %72 = mul i32 %71, 200
  %73 = add i32 %15, %72
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7
  %77 = fsub contract double %69, %76
  %78 = fmul contract double %77, 5.000000e-01
  %79 = load double, double addrspace(4)* @dz, align 8, !tbaa !7
  %80 = fdiv contract double %78, %79
  %81 = getelementptr inbounds double, double addrspace(1)* %3, i64 %44
  store double %80, double addrspace(1)* %81, align 8, !tbaa !7
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
