; ModuleID = '../data/hip_kernels/9584/6/main.cu'
source_filename = "../data/hip_kernels/9584/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8get_diagPdS_j(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = shl nuw i32 1, %2
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %99

15:                                               ; preds = %3
  %16 = and i32 %12, 1
  %17 = shl nuw nsw i32 %16, 1
  %18 = and i32 %12, 2
  %19 = shl nuw nsw i32 %18, 1
  %20 = shl nuw nsw i32 %18, 2
  %21 = or i32 %17, %20
  %22 = or i32 %21, %19
  %23 = and i32 %12, 4
  %24 = shl nuw nsw i32 %23, 2
  %25 = shl nuw nsw i32 %23, 3
  %26 = or i32 %22, %25
  %27 = or i32 %26, %24
  %28 = and i32 %12, 8
  %29 = shl nuw nsw i32 %28, 3
  %30 = shl nuw nsw i32 %28, 4
  %31 = or i32 %27, %30
  %32 = or i32 %31, %29
  %33 = and i32 %12, 16
  %34 = shl nuw nsw i32 %33, 4
  %35 = shl nuw nsw i32 %33, 5
  %36 = or i32 %32, %35
  %37 = or i32 %36, %34
  %38 = and i32 %12, 32
  %39 = shl nuw nsw i32 %38, 5
  %40 = shl nuw nsw i32 %38, 6
  %41 = or i32 %37, %40
  %42 = or i32 %41, %39
  %43 = and i32 %12, 64
  %44 = shl nuw nsw i32 %43, 6
  %45 = shl nuw nsw i32 %43, 7
  %46 = or i32 %42, %45
  %47 = or i32 %46, %44
  %48 = and i32 %12, 128
  %49 = shl nuw nsw i32 %48, 7
  %50 = shl nuw nsw i32 %48, 8
  %51 = or i32 %47, %50
  %52 = or i32 %51, %49
  %53 = and i32 %12, 256
  %54 = shl nuw nsw i32 %53, 8
  %55 = shl nuw nsw i32 %53, 9
  %56 = or i32 %52, %55
  %57 = or i32 %56, %54
  %58 = and i32 %12, 512
  %59 = shl nuw nsw i32 %58, 9
  %60 = shl nuw nsw i32 %58, 10
  %61 = or i32 %57, %60
  %62 = or i32 %61, %59
  %63 = and i32 %12, 1024
  %64 = shl nuw nsw i32 %63, 10
  %65 = shl nuw nsw i32 %63, 11
  %66 = or i32 %62, %65
  %67 = or i32 %66, %64
  %68 = and i32 %12, 2048
  %69 = shl nuw nsw i32 %68, 11
  %70 = shl nuw nsw i32 %68, 12
  %71 = or i32 %67, %70
  %72 = or i32 %71, %69
  %73 = and i32 %12, 4096
  %74 = shl nuw nsw i32 %73, 12
  %75 = shl nuw nsw i32 %73, 13
  %76 = or i32 %72, %75
  %77 = or i32 %76, %74
  %78 = and i32 %12, 8192
  %79 = shl nuw nsw i32 %78, 13
  %80 = shl nuw nsw i32 %78, 14
  %81 = or i32 %77, %80
  %82 = or i32 %81, %79
  %83 = and i32 %12, 16384
  %84 = shl nuw nsw i32 %83, 14
  %85 = shl nuw nsw i32 %83, 15
  %86 = or i32 %82, %85
  %87 = or i32 %86, %84
  %88 = and i32 %12, 32768
  %89 = shl nuw nsw i32 %88, 15
  %90 = shl nuw i32 %88, 16
  %91 = or i32 %87, %90
  %92 = or i32 %91, %89
  %93 = or i32 %92, %16
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds double, double addrspace(1)* %0, i64 %94
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7, !amdgpu.noclobber !5
  %97 = sext i32 %12 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %1, i64 %97
  store double %96, double addrspace(1)* %98, align 8, !tbaa !7
  br label %99

99:                                               ; preds = %3, %15
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
