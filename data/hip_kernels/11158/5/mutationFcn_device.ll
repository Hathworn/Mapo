; ModuleID = '../data/hip_kernels/11158/5/main.cu'
source_filename = "../data/hip_kernels/11158/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

@c_LB = protected addrspace(1) externally_initialized global [10 x float] zeroinitializer, align 16
@c_UB = protected addrspace(1) externally_initialized global [10 x float] zeroinitializer, align 16
@c_a = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aa = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aaa = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aRow = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@c_aaaRow = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@c_Dysum = protected local_unnamed_addr addrspace(1) externally_initialized global [9 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast ([10 x float] addrspace(1)* @c_LB to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([10 x float] addrspace(1)* @c_UB to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11mutationFcnPfP12hiprandState(float addrspace(1)* nocapture %0, %struct.hiprandState addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %4, i32 0, i32 0, i32 0
  %6 = load i32, i32 addrspace(1)* %5, align 8
  %7 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %4, i32 0, i32 0, i32 5, i64 0
  %8 = load i32, i32 addrspace(1)* %7, align 8
  %9 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %4, i32 0, i32 0, i32 5, i64 4
  %10 = load i32, i32 addrspace(1)* %9, align 8
  %11 = lshr i32 %8, 2
  %12 = xor i32 %11, %8
  %13 = shl i32 %10, 4
  %14 = shl i32 %12, 1
  %15 = xor i32 %13, %14
  %16 = xor i32 %15, %10
  %17 = xor i32 %16, %12
  %18 = add i32 %6, 362437
  %19 = add i32 %18, %17
  %20 = uitofp i32 %19 to float
  %21 = fmul contract float %20, 0x3DF0000000000000
  %22 = fadd contract float %21, 0x3DF0000000000000
  %23 = sitofp i32 %3 to float
  %24 = fmul contract float %23, 3.750000e-01
  %25 = fdiv contract float %24, 5.000000e+02
  %26 = fsub contract float 5.000000e-01, %25
  %27 = fpext float %22 to double
  %28 = fcmp contract olt double %27, 1.000000e-02
  br i1 %28, label %29, label %153

29:                                               ; preds = %2
  %30 = and i32 %19, 1
  %31 = icmp eq i32 %30, 0
  %32 = mul nuw nsw i32 %3, 10
  br i1 %31, label %153, label %33

33:                                               ; preds = %29
  %34 = zext i32 %32 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5
  %37 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 0), align 16, !tbaa !5
  %38 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 0), align 16, !tbaa !5
  %39 = fsub contract float %37, %38
  %40 = fmul contract float %26, %39
  %41 = fmul contract float %22, %40
  %42 = fadd contract float %36, %41
  %43 = fcmp contract ule float %42, %37
  %44 = fcmp contract uge float %42, %38
  tail call void @llvm.assume(i1 %43)
  tail call void @llvm.assume(i1 %44)
  store float %42, float addrspace(1)* %35, align 4, !tbaa !5
  %45 = or i32 %32, 1
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5
  %49 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 1), align 4, !tbaa !5
  %50 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 1), align 4, !tbaa !5
  %51 = fsub contract float %49, %50
  %52 = fmul contract float %26, %51
  %53 = fmul contract float %22, %52
  %54 = fadd contract float %48, %53
  %55 = fcmp contract ule float %54, %49
  %56 = fcmp contract uge float %54, %50
  tail call void @llvm.assume(i1 %55)
  tail call void @llvm.assume(i1 %56)
  store float %54, float addrspace(1)* %47, align 4, !tbaa !5
  %57 = add nuw nsw i32 %32, 2
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 2), align 8, !tbaa !5
  %62 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 2), align 8, !tbaa !5
  %63 = fsub contract float %61, %62
  %64 = fmul contract float %26, %63
  %65 = fmul contract float %22, %64
  %66 = fadd contract float %60, %65
  %67 = fcmp contract ule float %66, %61
  %68 = fcmp contract uge float %66, %62
  tail call void @llvm.assume(i1 %67)
  tail call void @llvm.assume(i1 %68)
  store float %66, float addrspace(1)* %59, align 4, !tbaa !5
  %69 = add nuw nsw i32 %32, 3
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 3), align 4, !tbaa !5
  %74 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 3), align 4, !tbaa !5
  %75 = fsub contract float %73, %74
  %76 = fmul contract float %26, %75
  %77 = fmul contract float %22, %76
  %78 = fadd contract float %72, %77
  %79 = fcmp contract ule float %78, %73
  %80 = fcmp contract uge float %78, %74
  tail call void @llvm.assume(i1 %79)
  tail call void @llvm.assume(i1 %80)
  store float %78, float addrspace(1)* %71, align 4, !tbaa !5
  %81 = add nuw nsw i32 %32, 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5
  %85 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 4), align 16, !tbaa !5
  %86 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 4), align 16, !tbaa !5
  %87 = fsub contract float %85, %86
  %88 = fmul contract float %26, %87
  %89 = fmul contract float %22, %88
  %90 = fadd contract float %84, %89
  %91 = fcmp contract ule float %90, %85
  %92 = fcmp contract uge float %90, %86
  tail call void @llvm.assume(i1 %91)
  tail call void @llvm.assume(i1 %92)
  store float %90, float addrspace(1)* %83, align 4, !tbaa !5
  %93 = add nuw nsw i32 %32, 5
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5
  %97 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 5), align 4, !tbaa !5
  %98 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 5), align 4, !tbaa !5
  %99 = fsub contract float %97, %98
  %100 = fmul contract float %26, %99
  %101 = fmul contract float %22, %100
  %102 = fadd contract float %96, %101
  %103 = fcmp contract ule float %102, %97
  %104 = fcmp contract uge float %102, %98
  tail call void @llvm.assume(i1 %103)
  tail call void @llvm.assume(i1 %104)
  store float %102, float addrspace(1)* %95, align 4, !tbaa !5
  %105 = add nuw nsw i32 %32, 6
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5
  %109 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 6), align 8, !tbaa !5
  %110 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 6), align 8, !tbaa !5
  %111 = fsub contract float %109, %110
  %112 = fmul contract float %26, %111
  %113 = fmul contract float %22, %112
  %114 = fadd contract float %108, %113
  %115 = fcmp contract ule float %114, %109
  %116 = fcmp contract uge float %114, %110
  tail call void @llvm.assume(i1 %115)
  tail call void @llvm.assume(i1 %116)
  store float %114, float addrspace(1)* %107, align 4, !tbaa !5
  %117 = add nuw nsw i32 %32, 7
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5
  %121 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 7), align 4, !tbaa !5
  %122 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 7), align 4, !tbaa !5
  %123 = fsub contract float %121, %122
  %124 = fmul contract float %26, %123
  %125 = fmul contract float %22, %124
  %126 = fadd contract float %120, %125
  %127 = fcmp contract ule float %126, %121
  %128 = fcmp contract uge float %126, %122
  tail call void @llvm.assume(i1 %127)
  tail call void @llvm.assume(i1 %128)
  store float %126, float addrspace(1)* %119, align 4, !tbaa !5
  %129 = add nuw nsw i32 %32, 8
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5
  %133 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 8), align 16, !tbaa !5
  %134 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 8), align 16, !tbaa !5
  %135 = fsub contract float %133, %134
  %136 = fmul contract float %26, %135
  %137 = fmul contract float %22, %136
  %138 = fadd contract float %132, %137
  %139 = fcmp contract ule float %138, %133
  %140 = fcmp contract uge float %138, %134
  tail call void @llvm.assume(i1 %139)
  tail call void @llvm.assume(i1 %140)
  store float %138, float addrspace(1)* %131, align 4, !tbaa !5
  %141 = add nuw nsw i32 %32, 9
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !5
  %145 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_UB, i64 0, i64 9), align 4, !tbaa !5
  %146 = load float, float addrspace(1)* getelementptr inbounds ([10 x float], [10 x float] addrspace(1)* @c_LB, i64 0, i64 9), align 4, !tbaa !5
  %147 = fsub contract float %145, %146
  %148 = fmul contract float %26, %147
  %149 = fmul contract float %22, %148
  %150 = fadd contract float %144, %149
  %151 = fcmp contract ule float %150, %145
  %152 = fcmp contract uge float %150, %146
  tail call void @llvm.assume(i1 %151)
  tail call void @llvm.assume(i1 %152)
  store float %150, float addrspace(1)* %143, align 4, !tbaa !5
  br label %153

153:                                              ; preds = %33, %29, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
