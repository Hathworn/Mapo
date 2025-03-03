; ModuleID = '../data/hip_kernels/11810/3/main.cu'
source_filename = "../data/hip_kernels/11810/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22UpdateVelocitiesKernelPdS_S_S_S_S_S_S_S_S_S_S_S_dii(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture readonly %11, double addrspace(1)* nocapture readonly %12, double %13, i32 %14, i32 %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %17
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !5, !invariant.load !6
  %31 = zext i16 %30 to i32
  %32 = mul i32 %27, %31
  %33 = add i32 %32, %26
  %34 = icmp sgt i32 %33, 0
  %35 = add nsw i32 %14, -1
  %36 = icmp slt i32 %33, %35
  %37 = select i1 %34, i1 %36, i1 false
  %38 = icmp slt i32 %25, %15
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %40, label %95

40:                                               ; preds = %16
  %41 = sitofp i32 %15 to double
  %42 = fdiv contract double 0x401921FB54442D18, %41
  %43 = fdiv contract double 1.000000e+00, %42
  %44 = zext i32 %33 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %2, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !6
  %47 = fmul contract double %46, %13
  %48 = getelementptr inbounds double, double addrspace(1)* %4, i64 %44
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7, !amdgpu.noclobber !6
  %50 = add nuw nsw i32 %33, 1
  %51 = mul nsw i32 %50, %15
  %52 = add nsw i32 %51, %25
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %11, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !6
  %56 = fmul contract double %49, %55
  %57 = getelementptr inbounds double, double addrspace(1)* %5, i64 %44
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !6
  %59 = mul nsw i32 %33, %15
  %60 = add nsw i32 %59, %25
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %11, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7, !amdgpu.noclobber !6
  %64 = fmul contract double %58, %63
  %65 = fsub contract double %56, %64
  %66 = getelementptr inbounds double, double addrspace(1)* %7, i64 %44
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7, !amdgpu.noclobber !6
  %68 = fmul contract double %67, %65
  %69 = getelementptr inbounds double, double addrspace(1)* %12, i64 %61
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7, !amdgpu.noclobber !6
  %71 = add nsw i32 %15, -1
  %72 = add i32 %71, %25
  %73 = srem i32 %72, %15
  %74 = add nsw i32 %73, %59
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %12, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7, !amdgpu.noclobber !6
  %78 = fsub contract double %70, %77
  %79 = fmul contract double %43, %78
  %80 = fadd contract double %68, %79
  %81 = fadd contract double %55, %63
  %82 = fmul contract double %81, 5.000000e-01
  %83 = fadd contract double %82, %80
  %84 = fmul contract double %47, %83
  %85 = getelementptr inbounds double, double addrspace(1)* %8, i64 %61
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7, !amdgpu.noclobber !6
  %87 = getelementptr inbounds double, double addrspace(1)* %8, i64 %75
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !6
  %89 = fadd contract double %86, %88
  %90 = fmul contract double %89, 5.000000e-01
  %91 = fdiv contract double %84, %90
  %92 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7, !amdgpu.noclobber !6
  %94 = fadd contract double %93, %91
  store double %94, double addrspace(1)* %92, align 8, !tbaa !7
  br label %95

95:                                               ; preds = %40, %16
  %96 = icmp slt i32 %33, %14
  %97 = select i1 %34, i1 %96, i1 false
  %98 = select i1 %97, i1 %38, i1 false
  br i1 %98, label %99, label %158

99:                                               ; preds = %95
  %100 = sitofp i32 %15 to double
  %101 = fdiv contract double 0x401921FB54442D18, %100
  %102 = fdiv contract double 1.000000e+00, %101
  %103 = zext i32 %33 to i64
  %104 = getelementptr inbounds double, double addrspace(1)* %9, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7
  %106 = fmul contract double %105, %13
  %107 = getelementptr inbounds double, double addrspace(1)* %3, i64 %103
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7
  %109 = mul nsw i32 %33, %15
  %110 = add nsw i32 %109, %25
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %10, i64 %111
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !7
  %114 = fmul contract double %108, %113
  %115 = add nsw i32 %33, -1
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %3, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !7
  %119 = mul nsw i32 %115, %15
  %120 = add nsw i32 %119, %25
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %10, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !7
  %124 = fmul contract double %118, %123
  %125 = fsub contract double %114, %124
  %126 = getelementptr inbounds double, double addrspace(1)* %6, i64 %103
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !7
  %128 = fmul contract double %127, %125
  %129 = add nsw i32 %25, 1
  %130 = srem i32 %129, %15
  %131 = add nsw i32 %130, %109
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %11, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !7
  %135 = getelementptr inbounds double, double addrspace(1)* %11, i64 %111
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !7
  %137 = fsub contract double %134, %136
  %138 = fmul contract double %102, %137
  %139 = fadd contract double %128, %138
  %140 = getelementptr inbounds double, double addrspace(1)* %12, i64 %111
  %141 = load double, double addrspace(1)* %140, align 8, !tbaa !7
  %142 = getelementptr inbounds double, double addrspace(1)* %12, i64 %121
  %143 = load double, double addrspace(1)* %142, align 8, !tbaa !7
  %144 = fadd contract double %141, %143
  %145 = fmul contract double %144, 5.000000e-01
  %146 = fsub contract double %139, %145
  %147 = fmul contract double %106, %146
  %148 = getelementptr inbounds double, double addrspace(1)* %8, i64 %111
  %149 = load double, double addrspace(1)* %148, align 8, !tbaa !7
  %150 = getelementptr inbounds double, double addrspace(1)* %8, i64 %121
  %151 = load double, double addrspace(1)* %150, align 8, !tbaa !7
  %152 = fadd contract double %149, %151
  %153 = fmul contract double %152, 5.000000e-01
  %154 = fdiv contract double %147, %153
  %155 = getelementptr inbounds double, double addrspace(1)* %1, i64 %111
  %156 = load double, double addrspace(1)* %155, align 8, !tbaa !7
  %157 = fadd contract double %156, %154
  store double %157, double addrspace(1)* %155, align 8, !tbaa !7
  br label %158

158:                                              ; preds = %99, %95
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
