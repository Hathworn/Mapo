; ModuleID = '../data/hip_kernels/1425/5/main.cu'
source_filename = "../data/hip_kernels/1425/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@matS = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16kernel_getRotMatPdS_i(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %163

14:                                               ; preds = %3
  %15 = mul nuw nsw i32 %4, 18
  %16 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @matS, i32 0, i32 %15
  %17 = getelementptr inbounds double, double addrspace(3)* %16, i32 9
  store double 0.000000e+00, double addrspace(3)* %16, align 8, !tbaa !7
  %18 = getelementptr inbounds double, double addrspace(3)* %16, i32 4
  store double 0.000000e+00, double addrspace(3)* %18, align 8, !tbaa !7
  %19 = getelementptr inbounds double, double addrspace(3)* %16, i32 8
  store double 0.000000e+00, double addrspace(3)* %19, align 8, !tbaa !7
  %20 = shl nsw i32 %12, 2
  %21 = add nuw nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %25 = getelementptr inbounds double, double addrspace(3)* %16, i32 5
  store double %24, double addrspace(3)* %25, align 8, !tbaa !7
  %26 = add nuw nsw i32 %20, 2
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %1, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7
  %30 = getelementptr inbounds double, double addrspace(3)* %16, i32 6
  store double %29, double addrspace(3)* %30, align 8, !tbaa !7
  %31 = add nuw nsw i32 %20, 3
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %1, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7
  %35 = getelementptr inbounds double, double addrspace(3)* %16, i32 1
  store double %34, double addrspace(3)* %35, align 8, !tbaa !7
  %36 = fneg contract double %24
  %37 = getelementptr inbounds double, double addrspace(3)* %16, i32 7
  store double %36, double addrspace(3)* %37, align 8, !tbaa !7
  %38 = fneg contract double %29
  %39 = getelementptr inbounds double, double addrspace(3)* %16, i32 2
  store double %38, double addrspace(3)* %39, align 8, !tbaa !7
  %40 = fneg contract double %34
  %41 = getelementptr inbounds double, double addrspace(3)* %16, i32 3
  store double %40, double addrspace(3)* %41, align 8, !tbaa !7
  %42 = getelementptr inbounds double, double addrspace(3)* %16, i32 10
  %43 = getelementptr inbounds double, double addrspace(3)* %16, i32 11
  %44 = getelementptr inbounds double, double addrspace(3)* %16, i32 12
  %45 = getelementptr inbounds double, double addrspace(3)* %16, i32 13
  %46 = getelementptr inbounds double, double addrspace(3)* %16, i32 14
  %47 = getelementptr inbounds double, double addrspace(3)* %16, i32 15
  %48 = getelementptr inbounds double, double addrspace(3)* %16, i32 16
  %49 = getelementptr inbounds double, double addrspace(3)* %16, i32 17
  %50 = fmul contract double %34, %34
  %51 = fsub contract double 0.000000e+00, %50
  %52 = fmul contract double %29, %38
  %53 = fadd contract double %51, %52
  store double %53, double addrspace(3)* %17, align 8, !tbaa !7
  %54 = fmul contract double %34, -0.000000e+00
  %55 = fadd contract double %54, 0.000000e+00
  %56 = fadd contract double %55, %54
  %57 = fmul contract double %29, %24
  %58 = fadd contract double %56, %57
  store double %58, double addrspace(3)* %44, align 8, !tbaa !7
  %59 = fmul contract double %29, 0.000000e+00
  %60 = fadd contract double %59, 0.000000e+00
  %61 = fmul contract double %34, %24
  %62 = fadd contract double %60, %61
  %63 = fadd contract double %62, %59
  store double %63, double addrspace(3)* %47, align 8, !tbaa !7
  %64 = fmul contract double %34, 0.000000e+00
  %65 = fadd contract double %64, 0.000000e+00
  %66 = fadd contract double %65, %64
  %67 = fmul contract double %24, %29
  %68 = fadd contract double %66, %67
  store double %68, double addrspace(3)* %42, align 8, !tbaa !7
  %69 = fadd contract double %51, 0.000000e+00
  %70 = fmul contract double %24, %24
  %71 = fsub contract double %69, %70
  store double %71, double addrspace(3)* %45, align 8, !tbaa !7
  %72 = fmul contract double %34, %29
  %73 = fadd contract double %72, 0.000000e+00
  %74 = fmul contract double %24, -0.000000e+00
  %75 = fadd contract double %73, %74
  %76 = fadd contract double %75, %74
  store double %76, double addrspace(3)* %48, align 8, !tbaa !7
  %77 = fmul contract double %29, -0.000000e+00
  %78 = fadd contract double %77, 0.000000e+00
  %79 = fmul contract double %24, %34
  %80 = fadd contract double %78, %79
  %81 = fadd contract double %80, %77
  store double %81, double addrspace(3)* %43, align 8, !tbaa !7
  %82 = fmul contract double %29, %34
  %83 = fadd contract double %82, 0.000000e+00
  %84 = load double, double addrspace(3)* %18, align 8, !tbaa !7
  %85 = fmul contract double %24, %84
  %86 = fadd contract double %83, %85
  %87 = load double, double addrspace(3)* %19, align 8, !tbaa !7
  %88 = load double, double addrspace(3)* %25, align 8, !tbaa !7
  %89 = fmul contract double %87, %88
  %90 = fadd contract double %86, %89
  store double %90, double addrspace(3)* %46, align 8, !tbaa !7
  %91 = fadd contract double %52, 0.000000e+00
  %92 = fmul contract double %24, %88
  %93 = fsub contract double %91, %92
  %94 = fmul contract double %87, %87
  %95 = fadd contract double %93, %94
  store double %95, double addrspace(3)* %49, align 8, !tbaa !7
  %96 = sext i32 %20 to i64
  %97 = getelementptr inbounds double, double addrspace(1)* %1, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !7, !amdgpu.noclobber !6
  %99 = fmul contract double %98, 2.000000e+00
  %100 = load double, double addrspace(3)* %16, align 8, !tbaa !7
  %101 = fmul contract double %99, %100
  %102 = fmul contract double %53, 2.000000e+00
  %103 = fadd contract double %101, %102
  %104 = load double, double addrspace(3)* %35, align 8, !tbaa !7
  %105 = fmul contract double %99, %104
  %106 = fmul contract double %68, 2.000000e+00
  %107 = fadd contract double %105, %106
  store double %107, double addrspace(3)* %35, align 8, !tbaa !7
  %108 = load double, double addrspace(3)* %39, align 8, !tbaa !7
  %109 = fmul contract double %99, %108
  %110 = fmul contract double %81, 2.000000e+00
  %111 = fadd contract double %109, %110
  store double %111, double addrspace(3)* %39, align 8, !tbaa !7
  %112 = load double, double addrspace(3)* %41, align 8, !tbaa !7
  %113 = fmul contract double %99, %112
  %114 = fmul contract double %58, 2.000000e+00
  %115 = fadd contract double %113, %114
  store double %115, double addrspace(3)* %41, align 8, !tbaa !7
  %116 = fmul contract double %99, %84
  %117 = fmul contract double %71, 2.000000e+00
  %118 = fadd contract double %116, %117
  %119 = fmul contract double %99, %88
  %120 = fmul contract double %90, 2.000000e+00
  %121 = fadd contract double %119, %120
  store double %121, double addrspace(3)* %25, align 8, !tbaa !7
  %122 = load double, double addrspace(3)* %30, align 8, !tbaa !7
  %123 = fmul contract double %99, %122
  %124 = fmul contract double %63, 2.000000e+00
  %125 = fadd contract double %123, %124
  store double %125, double addrspace(3)* %30, align 8, !tbaa !7
  %126 = load double, double addrspace(3)* %37, align 8, !tbaa !7
  %127 = fmul contract double %99, %126
  %128 = fmul contract double %76, 2.000000e+00
  %129 = fadd contract double %127, %128
  store double %129, double addrspace(3)* %37, align 8, !tbaa !7
  %130 = fmul contract double %99, %87
  %131 = fmul contract double %95, 2.000000e+00
  %132 = fadd contract double %130, %131
  %133 = fadd contract double %103, 1.000000e+00
  store double %133, double addrspace(3)* %16, align 8, !tbaa !7
  %134 = fadd contract double %118, 1.000000e+00
  store double %134, double addrspace(3)* %18, align 8, !tbaa !7
  %135 = fadd contract double %132, 1.000000e+00
  store double %135, double addrspace(3)* %19, align 8, !tbaa !7
  %136 = mul nsw i32 %12, 9
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds double, double addrspace(1)* %0, i64 %137
  store double %133, double addrspace(1)* %138, align 8, !tbaa !7
  %139 = add nsw i32 %136, 1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %0, i64 %140
  store double %107, double addrspace(1)* %141, align 8, !tbaa !7
  %142 = add nsw i32 %136, 2
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double, double addrspace(1)* %0, i64 %143
  store double %111, double addrspace(1)* %144, align 8, !tbaa !7
  %145 = add nsw i32 %136, 3
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %0, i64 %146
  store double %115, double addrspace(1)* %147, align 8, !tbaa !7
  %148 = add nsw i32 %136, 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %0, i64 %149
  store double %134, double addrspace(1)* %150, align 8, !tbaa !7
  %151 = add nsw i32 %136, 5
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds double, double addrspace(1)* %0, i64 %152
  store double %121, double addrspace(1)* %153, align 8, !tbaa !7
  %154 = add nsw i32 %136, 6
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %0, i64 %155
  store double %125, double addrspace(1)* %156, align 8, !tbaa !7
  %157 = add nsw i32 %136, 7
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds double, double addrspace(1)* %0, i64 %158
  store double %129, double addrspace(1)* %159, align 8, !tbaa !7
  %160 = add nsw i32 %136, 8
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds double, double addrspace(1)* %0, i64 %161
  store double %135, double addrspace(1)* %162, align 8, !tbaa !7
  br label %163

163:                                              ; preds = %14, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
