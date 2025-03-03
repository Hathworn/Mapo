; ModuleID = '../data/hip_kernels/7764/0/main.cu'
source_filename = "../data/hip_kernels/7764/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12mult2_kernelPdS_S_S_i(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = ashr i32 %4, 1
  %16 = shl i32 %14, 1
  %17 = icmp eq i32 %14, 0
  br i1 %17, label %90, label %18

18:                                               ; preds = %5
  %19 = ashr i32 %4, 2
  %20 = sub nsw i32 %4, %16
  %21 = sub nsw i32 %19, %14
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %3, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7, !amdgpu.noclobber !5
  %25 = fsub contract double 5.000000e-01, %24
  %26 = sext i32 %14 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %3, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !7, !amdgpu.noclobber !5
  %29 = sext i32 %16 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %1, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7, !amdgpu.noclobber !5
  %32 = add nuw nsw i32 %16, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = sext i32 %20 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %20, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !5
  %43 = fsub contract double %31, %38
  %44 = fadd contract double %35, %42
  %45 = fmul contract double %25, %43
  %46 = fmul contract double %28, %44
  %47 = fsub contract double %45, %46
  %48 = fmul contract double %25, %44
  %49 = fmul contract double %28, %43
  %50 = fadd contract double %49, %48
  %51 = fsub contract double %31, %47
  %52 = fsub contract double %35, %50
  %53 = fadd contract double %38, %47
  %54 = fsub contract double %42, %50
  %55 = getelementptr inbounds double, double addrspace(1)* %2, i64 %29
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7, !amdgpu.noclobber !5
  %57 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7, !amdgpu.noclobber !5
  %61 = getelementptr inbounds double, double addrspace(1)* %2, i64 %40
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7, !amdgpu.noclobber !5
  %63 = fmul contract double %58, %51
  %64 = fmul contract double %56, %52
  %65 = fadd contract double %63, %64
  %66 = fmul contract double %56, %51
  %67 = fmul contract double %58, %52
  %68 = fsub contract double %66, %67
  %69 = fmul contract double %53, %62
  %70 = fmul contract double %60, %54
  %71 = fadd contract double %69, %70
  %72 = fmul contract double %60, %53
  %73 = fmul contract double %54, %62
  %74 = fsub contract double %72, %73
  %75 = fsub contract double %68, %74
  %76 = fadd contract double %65, %71
  %77 = fmul contract double %25, %75
  %78 = fmul contract double %28, %76
  %79 = fadd contract double %77, %78
  %80 = fmul contract double %25, %76
  %81 = fmul contract double %28, %75
  %82 = fsub contract double %80, %81
  %83 = fsub contract double %68, %79
  %84 = getelementptr inbounds double, double addrspace(1)* %0, i64 %29
  store double %83, double addrspace(1)* %84, align 8, !tbaa !7
  %85 = fsub contract double %82, %65
  %86 = getelementptr inbounds double, double addrspace(1)* %0, i64 %33
  store double %85, double addrspace(1)* %86, align 8, !tbaa !7
  %87 = fadd contract double %74, %79
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  store double %87, double addrspace(1)* %88, align 8, !tbaa !7
  %89 = fsub contract double %82, %71
  br label %124

90:                                               ; preds = %5
  %91 = load double, double addrspace(1)* %1, align 8, !tbaa !7, !amdgpu.noclobber !5
  %92 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7, !amdgpu.noclobber !5
  %94 = load double, double addrspace(1)* %2, align 8, !tbaa !7, !amdgpu.noclobber !5
  %95 = getelementptr inbounds double, double addrspace(1)* %2, i64 1
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7, !amdgpu.noclobber !5
  %97 = fmul contract double %91, %94
  %98 = fmul contract double %93, %96
  %99 = fadd contract double %97, %98
  store double %99, double addrspace(1)* %0, align 8, !tbaa !7
  %100 = fneg contract double %91
  %101 = fmul contract double %96, %100
  %102 = fmul contract double %93, %94
  %103 = fsub contract double %101, %102
  %104 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  store double %103, double addrspace(1)* %104, align 8, !tbaa !7
  %105 = sext i32 %15 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %1, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !7
  %108 = add nsw i32 %15, 1
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double addrspace(1)* %1, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !7
  %112 = getelementptr inbounds double, double addrspace(1)* %2, i64 %105
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !7
  %114 = getelementptr inbounds double, double addrspace(1)* %2, i64 %109
  %115 = load double, double addrspace(1)* %114, align 8, !tbaa !7
  %116 = fneg contract double %107
  %117 = fmul contract double %115, %116
  %118 = fmul contract double %111, %113
  %119 = fsub contract double %117, %118
  %120 = getelementptr inbounds double, double addrspace(1)* %0, i64 %109
  store double %119, double addrspace(1)* %120, align 8, !tbaa !7
  %121 = fmul contract double %107, %113
  %122 = fmul contract double %111, %115
  %123 = fsub contract double %121, %122
  br label %124

124:                                              ; preds = %90, %18
  %125 = phi i64 [ %105, %90 ], [ %40, %18 ]
  %126 = phi double [ %123, %90 ], [ %89, %18 ]
  %127 = getelementptr inbounds double, double addrspace(1)* %0, i64 %125
  store double %126, double addrspace(1)* %127, align 8, !tbaa !7
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
